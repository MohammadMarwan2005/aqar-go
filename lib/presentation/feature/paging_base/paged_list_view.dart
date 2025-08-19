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

    // Create the list view content
    final listView = SizedBox(
      height: widget.height,
      width: widget.width,
      child: RefreshIndicator(
        onRefresh: () async {
          widget.onRefresh();
        },
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: widget.scrollDirection,
          controller: scrollController,
          itemCount: currentItems.length + 1,
          itemBuilder: (context, index) {
            if (index == currentItems.length) {
              return Center(
                child: widget.state.when(
                  loaded: (items, page, hasReachedEnd) {
                    return Padding(
                      padding: EdgeInsets.all(16.0),
                      child:
                          (widget.noMoreItemsPlaceholder != null)
                              ? widget.noMoreItemsPlaceholder!(widget.state)
                              : Text("No more items".tr(context)),
                    );
                  },
                  loading:
                      (oldData, page, hasReachedEnd) => Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child:
                              widget.loadingPlaceholder ??
                              CircularProgressIndicator(strokeWidth: 3),
                        ),
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
            return widget.itemBuilder(currentItems[index]);
          },
        ),
      ),
    );

    // Wrap with appropriate constraints based on scroll direction
    return widget.scrollDirection == Axis.horizontal
        ? SizedBox(
          height: widget.height ?? 250, // Fixed height for horizontal scroll
          child: listView,
        )
        :
      listView;
  }
}
