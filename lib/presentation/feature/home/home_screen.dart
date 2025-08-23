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

  const TitleWithSeeAll({
    super.key,
    required this.title,
    required this.onSeeAllClick,
    this.seeAllPlaceholder,
    this.showSeeAll = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
        const Spacer(),
        if (showSeeAll)
          TextButton(
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final backgroundColor = colorScheme.primary.withAlpha(220);
    final foregroundOnPrimary = colorScheme.onPrimary;
    final foregroundOnSurface = colorScheme.onSurface;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // ---- AppBar ----
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Container(
                  //   width: 45,
                  //   height: 45,
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     border: Border.all(color: foregroundOnPrimary),
                  //   ),
                  //   child: Icon(Icons.home_outlined, color: foregroundOnPrimary),
                  // ),
                  IconButton(
                    onPressed: () {
                      context.pushRoute(Routes.favoriteAds);
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      color: foregroundOnPrimary,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "AqarGo".tr(context),
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: foregroundOnPrimary,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none,
                      color: foregroundOnPrimary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // ---- SearchBar ----
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: foregroundOnPrimary.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: foregroundOnPrimary),
                          const SizedBox(width: 8),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                context.pushRoute(Routes.searchFilters);
                              },
                              child: AbsorbPointer(
                                child: TextField(
                                  style: TextStyle(color: foregroundOnPrimary),
                                  decoration: InputDecoration(
                                    hintText: "Search".tr(context),
                                    hintStyle: TextStyle(
                                      color: foregroundOnPrimary.withOpacity(
                                        0.7,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: foregroundOnPrimary.withOpacity(0.15),
                    child: IconButton(
                      onPressed: () {
                        context.pushRoute(Routes.searchFilters);
                      },
                      icon: Icon(Icons.filter_list, color: foregroundOnPrimary),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ---- Scrollable Bottom Content ----
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: RefreshIndicator(
                  onRefresh: () async {
                    context.read<NearToYouCubit>().resetState();
                    context.read<RecommendedAdsCubit>().resetState();
                  },
                  child: ScreenPadding(
                    horizontal: 16,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 8),
                          _NearToYouWidget(),
                          SizedBox(height: 32),
                          Center(child: SwitchLangLabel()),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class BadHomeScreen extends StatelessWidget {
  const BadHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("AqarGo".tr(context)),
        actions: [
          // if we keep this, we will need to add a badge when the user add new favorites
          // solution: lets remove it :)
          // IconButton(
          //   icon: const Icon(Icons.favorite_border),
          //   onPressed: () {
          //     context.pushRoute(Routes.favoriteAds);
          //   },
          // ),
          // IconButton(
          //   icon: const Icon(Icons.search),
          //   onPressed: () {
          //     context.pushRoute(Routes.searchFilters);
          //   },
          // ),
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
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.search),
                              const SizedBox(width: 8),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    context.pushRoute(Routes.searchFilters);
                                  },
                                  child: AbsorbPointer(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Search".tr(context),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor:
                        Theme.of(context).colorScheme.inversePrimary,
                        child: IconButton(
                          onPressed: () {
                            context.pushRoute(Routes.searchFilters);
                          },
                          icon: const Icon(Icons.filter_list),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _NearToYouWidget(),
                  const SizedBox(height: 32),
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
