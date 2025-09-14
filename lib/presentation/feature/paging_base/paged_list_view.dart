import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:aqar_go/presentation/feature/paging_base/cubit/paging_cubit.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/widgets/error_message.dart';
import 'package:flutter/material.dart';

class PagedListView<T> extends StatefulWidget {
  final PagingState<T> state;
  final Widget Function(T item) itemBuilder;
  final void Function() fetchNextPage;
  final void Function() onRefresh;
  final Axis scrollDirection;
  final double? height;
  final double? width;
  final Widget Function(DomainError error, void Function() onTryAgain)?
  errorPlaceholder;
  final Widget? loadingPlaceholder;
  final Widget Function(PagingState<T> state)? noMoreItemsPlaceholder;
  final double itemPadding;
  final ScrollPhysics physics;
  final bool shrinkWrap;
  final Widget? leadingWidget;

  const PagedListView({
    super.key,
    required this.state,
    required this.itemBuilder,
    required this.fetchNextPage,
    required this.scrollDirection,
    required this.onRefresh,
    this.height,
    this.width,
    this.errorPlaceholder,
    this.loadingPlaceholder,
    this.noMoreItemsPlaceholder,
    this.itemPadding = 16,
    this.physics = const AlwaysScrollableScrollPhysics(),
    this.shrinkWrap = false,
    this.leadingWidget,
  });

  @override
  State<PagedListView<T>> createState() => _PagedListViewState<T>();
}

class _PagedListViewState<T> extends State<PagedListView<T>> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 500) {
      if (widget.state.isError()) {
        // fetchNextPageWithoutLoading();
      } else {
        widget.fetchNextPage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentItems = widget.state.getCurrentLoadedItems();

    final int baseCount = currentItems.length + 1; // +1 for loader/footer
    final int totalCount =
    widget.leadingWidget != null ? baseCount + 1 : baseCount;

    final listView = SizedBox(
      height: widget.height,
      width: widget.width,
      child: RefreshIndicator(
        onRefresh: () async {
          widget.onRefresh();
        },
        child: ListView.builder(
          physics: widget.physics,
          shrinkWrap: widget.shrinkWrap,
          scrollDirection: widget.scrollDirection,
          controller: scrollController,
          itemCount: totalCount,
          itemBuilder: (context, index) {
            // Handle leading widget first
            if (widget.leadingWidget != null && index == 0) {
              return widget.leadingWidget!;
            }

            // Adjust index if leading widget exists
            final adjustedIndex =
            widget.leadingWidget != null ? index - 1 : index;

            // Loader / No-more-items / Error placeholder
            if (adjustedIndex == currentItems.length) {
              return Center(
                child: widget.state.when(
                  loaded: (items, page, hasReachedEnd) {
                    return Padding(
                      padding: EdgeInsets.zero,
                      child: (widget.noMoreItemsPlaceholder != null)
                          ? widget.noMoreItemsPlaceholder!(widget.state)
                          : Text("No more items".tr(context)),
                    );
                  },
                  loading: (oldData, page, hasReachedEnd) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: widget.loadingPlaceholder ??
                        const CircularProgressIndicator(strokeWidth: 3),
                  ),
                  error: (oldData, error, page, hasReachedEnd) {
                    if (widget.errorPlaceholder != null) {
                      return widget.errorPlaceholder!(
                        error,
                        widget.fetchNextPage,
                      );
                    } else {
                      return SizedBox(
                        width: widget.height,
                        height: widget.height,
                        child: ErrorMessage(
                          error: error,
                          onTryAgain: widget.fetchNextPage,
                        ),
                      );
                    }
                  },
                ),
              );
            }

            // Normal item
            return widget.itemBuilder(currentItems[adjustedIndex]);
          },
        ),
      ),
    );

    return widget.scrollDirection == Axis.horizontal
        ? SizedBox(
      height: widget.height ?? 250,
      child: listView,
    )
        : listView;
  }
}
