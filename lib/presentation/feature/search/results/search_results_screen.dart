import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/widgets/app_button.dart';
import 'package:aqar_go/presentation/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/model/ad/ad.dart';
import '../../../../domain/model/search/search_filter_settings.dart';
import '../../../routing/routes.dart';
import '../../../widgets/ad_card.dart';
import '../../../widgets/screen_horizontal_padding.dart';
import '../../paging_base/cubit/paging_cubit.dart';
import '../../paging_base/paged_list_view.dart';
import 'cubit/search_results_cubit.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchResultsCubit>();
    return Scaffold(
      appBar: AppBar(title: Text("Search Results".tr(context))),
      body: SafeArea(
        child: ScreenPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _FilterInfo(cubit.searchFilterSettings),
              Expanded(
                child: BlocBuilder<SearchResultsCubit, PagingState<Ad>>(
                  builder: (context, state) {
                    return PagedListView(
                      scrollDirection: Axis.vertical,
                      state: state,
                      itemBuilder: (ad) {
                        return AdCard(ad: ad);
                      },
                      fetchNextPage: () {
                        context.read<SearchResultsCubit>().fetchNextPageItems();
                      },
                      onRefresh: () {
                        context.read<SearchResultsCubit>().resetState();
                      },
                      errorPlaceholder:
                          (error, onTryAgain) => ErrorMessage(
                            error: error,
                            onTryAgain: onTryAgain,
                            detailsWidget:
                                (details) => Column(
                                  children:
                                      details.map((e) => Text(e)).toList(),
                                ),
                          ),
                      noMoreItemsPlaceholder: (state) {
                        if (state.getCurrentLoadedItems().isEmpty) {
                          return Center(
                            child: Text(
                              "No results found for your search".tr(context),
                            ),
                          );
                        }
                        if (state.getCurrentLoadedItems().length <= 10) {
                          return Center(
                            child: AppButton(
                              onPressed: () {},
                              text: "Notify Me".tr(context),
                            ),
                          );
                        }
                        return SizedBox.shrink();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterInfo extends StatelessWidget {
  final SearchFilterSettings settings;

  const _FilterInfo(this.settings);

  final int numberOfFilters = 3;

  @override
  Widget build(BuildContext context) {
    final labelIds = settings.withNullInsteadOfEmptyLists().getLabelIds();
    return SizedBox(
      height: labelIds.isNotEmpty ? 48 : 0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...labelIds
              .take(numberOfFilters)
              .map(
                (filter) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Chip(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    iconTheme: IconThemeData(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    label: Text(filter.tr(context)),
                    deleteIcon: Icon(Icons.close_outlined),
                    onDeleted: () {
                      _goToFilter(context, settings);
                    },
                  ),
                ),
              ),
          if (labelIds.length > numberOfFilters)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Chip(
                backgroundColor: Theme.of(context).colorScheme.primary,
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                label: Text(
                  "+${labelIds.length - numberOfFilters}".tr(context),
                ),
                iconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                deleteIcon: Icon(Icons.filter_alt),
                onDeleted: () {
                  _goToFilter(context, settings);
                },
              ),
            ),
        ],
      ),
    );
  }

  void _goToFilter(BuildContext context, settings) {
    context.popRoute();
  }
}
