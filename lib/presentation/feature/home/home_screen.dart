import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/model/ad/ad.dart';
import '../../lang/ui/switch_lang_label.dart';
import '../../routing/routes.dart';
import '../../widgets/screen_horizontal_padding.dart';
import '../../widgets/small_ad_card.dart';
import '../near_to_you/cubit/near_to_you_cubit.dart';
import '../paging_base/cubit/paging_cubit.dart';
import '../paging_base/paged_list_view.dart';
import '../recommended_ads/cubit/recommended_ads_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("AqarGo".tr(context)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              context.pushRoute(Routes.searchFilters);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ScreenPadding(
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<NearToYouCubit>().resetState();
              context.read<RecommendedAdsCubit>().resetState();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  _NearToYouWidget(),
                  SizedBox(height: 32),
                  SwitchLangLabel(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NearToYouWidget extends StatelessWidget {
  const _NearToYouWidget();

  @override
  Widget build(BuildContext context) {
    final cardWidth = SmallAdCard.getWidth(context);
    final cardHeight = SmallAdCard.getHeight(context);
    return Column(
      children: [
        TitleWithSeeAll(
          title: "Near To You".tr(context),
          onSeeAllClick: () {
            context.pushRoute(Routes.nearToYou);
          },
        ),
        SizedBox(height: 8),
        BlocBuilder<NearToYouCubit, PagingState<Ad>>(
          builder: (context, state) {
            return PagedListView(
              height: cardHeight,
              scrollDirection: Axis.horizontal,
              state: state,
              itemBuilder: (item) {
                return SmallAdCard(
                  width: cardWidth,
                  height: cardHeight,
                  ad: item,
                  onTap: () {
                    context.pushRoute(Routes.getViewAd(item.id));
                  },
                );
              },
              fetchNextPage: () {
                context.read<NearToYouCubit>().fetchNextPageItems();
              },
              onRefresh: () {
                context.read<NearToYouCubit>().resetState();
              },
            );
          },
        ),
        TitleWithSeeAll(
          title: "Recommended".tr(context),
          onSeeAllClick: () {
            context.pushRoute(Routes.recommendedAds);
          },
        ),
        SizedBox(height: 8),
        BlocBuilder<RecommendedAdsCubit, PagingState<Ad>>(
          builder: (context, state) {
            return PagedListView(
              height: cardHeight,
              scrollDirection: Axis.horizontal,
              state: state,
              itemBuilder: (item) {
                return SmallAdCard(
                  width: cardWidth,
                  height: cardHeight,
                  ad: item,
                  onTap: () {
                    context.pushRoute(Routes.getViewAd(item.id));
                  },
                );
              },
              fetchNextPage: () {
                context.read<RecommendedAdsCubit>().fetchNextPageItems();
              },
              onRefresh: () {
                context.read<RecommendedAdsCubit>().resetState();
              },
            );
          },
        ),
      ],
    );
  }
}

class TitleWithSeeAll extends StatelessWidget {
  final String title;
  final Function() onSeeAllClick;
  final String? seeAllPlaceholder;
  final bool showSeeAll;

  const TitleWithSeeAll({super.key, required this.title, required this.onSeeAllClick, this.seeAllPlaceholder, this.showSeeAll = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
        const Spacer(),
        if(showSeeAll) TextButton(
          onPressed: onSeeAllClick,
          child: Text(
            seeAllPlaceholder ?? "See All".tr(context),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
