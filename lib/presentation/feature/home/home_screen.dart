import 'package:aqar_go/presentation/feature/notification/unread_count/notification_icon.dart';
import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/model/ad/ad.dart';
import '../../lang/ui/switch_lang_label.dart';
import '../../routing/routes.dart';
import '../../widgets/ad_card.dart';
import '../../widgets/screen_horizontal_padding.dart';
import '../../widgets/small_ad_card.dart';
import '../near_to_you/cubit/near_to_you_cubit.dart';
import '../notification/unread_count/cubit/notification_unread_count_cubit.dart';
import '../paging_base/cubit/paging_cubit.dart';
import '../paging_base/paged_list_view.dart';
import '../recommended_ads/cubit/recommended_ads_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _onRefresh(BuildContext context) async {
    context.read<NearToYouCubit>().resetState();
    context.read<RecommendedAdsCubit>().resetState();
    context.read<NotificationUnreadCountCubit>().fetchCount();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context)
        .colorScheme
        .primary
        .withAlpha(220);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          onRefresh: () => _onRefresh(context),
          child: const _RecommendedAndNearToYouWidget(),
        ),
      ),
    );
  }
}

class _RecommendedAndNearToYouWidget extends StatelessWidget {
  const _RecommendedAndNearToYouWidget();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final cardWidth = SmallAdCard.getWidth(context);
    final cardHeight = SmallAdCard.getHeight(context);

    return Scaffold(
      body: BlocBuilder<NearToYouCubit, PagingState<Ad>>(
        builder: (context, nearToYouState) {
          return PagedListView(
            scrollDirection: Axis.vertical,
            state: nearToYouState,
            leadingWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TopBar(colors: colors, theme: theme),
                _RecommendedSection(cardWidth: cardWidth, cardHeight: cardHeight),
                _NearToYouTitle(),
              ],
            ),
            itemBuilder: (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: AdCard(ad: item),
            ),
            fetchNextPage: () => context.read<NearToYouCubit>().fetchNextPageItems(),
            onRefresh: () => context.read<NearToYouCubit>().resetState(),
            noMoreItemsPlaceholder: (_) => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}

//
// ────────────────────  UI SUBWIDGETS ────────────────────
//

class _TopBar extends StatelessWidget {
  const _TopBar({required this.colors, required this.theme});
  final ColorScheme colors;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final foreground = colors.onPrimary;
    final background = colors.primary.withAlpha(220);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          color: background,
          child: Column(
            children: [
              _AppBarRow(foreground: foreground, theme: theme),
              const SizedBox(height: 12),
              _SearchBar(foreground: foreground),
              const SizedBox(height: 40),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 16,
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          ),
        ),
      ],
    );
  }
}

class _AppBarRow extends StatelessWidget {
  const _AppBarRow({required this.foreground, required this.theme});
  final Color foreground;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: foreground),
            onPressed: () => context.pushRoute(Routes.favoriteAds),
          ),
          const Spacer(),
          Text(
            "AqarGo".tr(context),
            style: theme.textTheme.titleLarge?.copyWith(color: foreground),
          ),
          const Spacer(),
          NotificationIcon(color: foreground),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({required this.foreground});
  final Color foreground;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: foreground.withOpacity(0.15),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: foreground),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => context.pushRoute(Routes.searchFilters),
                      child: AbsorbPointer(
                        child: TextField(
                          style: TextStyle(color: foreground),
                          decoration: InputDecoration(
                            hintText: "Search".tr(context),
                            hintStyle: TextStyle(
                              color: foreground.withOpacity(0.7),
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
            backgroundColor: foreground.withOpacity(0.15),
            child: IconButton(
              icon: Icon(Icons.filter_list, color: foreground),
              onPressed: () => context.pushRoute(Routes.searchFilters),
            ),
          ),
        ],
      ),
    );
  }
}

class _RecommendedSection extends StatelessWidget {
  const _RecommendedSection({required this.cardWidth, required this.cardHeight});
  final double cardWidth;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    return ScreenPadding(
      horizontal: 16,
      child: Column(
        children: [
          TitleWithSeeAll(
            title: "Recommended".tr(context),
            onSeeAllClick: () => context.pushRoute(Routes.recommendedAds),
          ),
          const SizedBox(height: 8),
          BlocBuilder<RecommendedAdsCubit, PagingState<Ad>>(
            builder: (context, state) {
              return PagedListView(
                height: cardHeight,
                scrollDirection: Axis.horizontal,
                state: state,
                itemBuilder: (item) => SmallAdCard(
                  width: cardWidth,
                  height: cardHeight,
                  ad: item,
                  onTap: () => context.pushRoute(Routes.getViewAd(item.id)),
                ),
                fetchNextPage: () =>
                    context.read<RecommendedAdsCubit>().fetchNextPageItems(),
                onRefresh: () =>
                    context.read<RecommendedAdsCubit>().resetState(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _NearToYouTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenPadding(
      horizontal: 16,
      child: TitleWithSeeAll(
        title: "Near To You".tr(context),
        onSeeAllClick: () => context.pushRoute(Routes.nearToYou),
      ),
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
              context.read<NotificationUnreadCountCubit>().fetchCount();
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
                  _RecommendedAndNearToYouWidget(),
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
