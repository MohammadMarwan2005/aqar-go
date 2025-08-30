import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/helper/ui_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/widgets/app_button.dart';
import 'package:aqar_go/presentation/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/model/ad/ad.dart';
import '../../../../domain/model/search/search_filter_settings.dart';
import '../../../routing/routes.dart';
import '../../../widgets/ad_card.dart';
import '../../../widgets/screen_horizontal_padding.dart';
import '../../notify_me/cubit/notify_me_cubit.dart';
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
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: AdCard(ad: ad),
                        );
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
                        return Column(
                          children: [
                            if (state.getCurrentLoadedItems().isEmpty)
                              Center(
                                child: Text(
                                  "No results found for your search".tr(
                                    context,
                                  ),
                                ),
                              ),
                            if (state.getCurrentLoadedItems().length <= 10)
                              _NotifyMeWidget(),
                          ],
                        );
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

class _NotifyMeWidget extends StatelessWidget {
  const _NotifyMeWidget();

  @override
  Widget build(BuildContext context) {
    return ScreenPadding(
      child: Center(
        child: BlocConsumer<NotifyMeCubit, NotifyMeState>(
          listener: (context, state) {
            return state.when(
              initial: () {},
              loading: () {},
              success: () {
                context.showMyAlertDialog("Done".tr(context), [
                  "We will notify you when someone publish an ad matches you search"
                      .tr(context),
                ], false);
              },
              error: (error) {
                context.showMyAlertDialogFromDomainError(error);
              },
            );
          },
          builder: (BuildContext context, NotifyMeState state) {
            final notifyMeCubit = context.read<NotifyMeCubit>();
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "No more results!".tr(context),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 16),
                    if (!state.isSuccess())
                      AppButton(
                        isLoading: state.isLoading(),
                        onPressed:
                            (state.isSuccess())
                                ? null
                                : () {
                                  if (notifyMeCubit.isGuest()) {
                                    context.showYouNeedToLoginAlertDialog(
                                      Routes.searchResults,
                                      extra:
                                          context
                                              .read<SearchResultsCubit>()
                                              .searchFilterSettings,
                                    );
                                  } else {
                                    notifyMeCubit.notifyMe();
                                  }
                                },
                        text: "Notify Me".tr(context),
                      ),
                    const SizedBox(height: 4),
                    _NotifyMeInfo(isSuccess: state.isSuccess()),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NotifyMeInfo extends StatelessWidget {
  final bool isSuccess;

  const _NotifyMeInfo({required this.isSuccess});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(),
        if (isSuccess) Icon(Icons.check, color: Colors.green, size: 20),
        if (!isSuccess)
          Icon(
            Icons.info,
            color: Theme.of(context).colorScheme.primary,
            size: 16,
          ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            textAlign: TextAlign.center,
            "We will notify you when someone publish an ad matches you search"
                .tr(context),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
