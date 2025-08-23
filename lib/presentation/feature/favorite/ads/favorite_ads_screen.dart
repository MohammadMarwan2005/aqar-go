import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/model/ad/ad.dart';
import '../../../widgets/ad_card.dart';
import '../../../widgets/screen_horizontal_padding.dart';
import '../../paging_base/cubit/paging_cubit.dart';
import '../../paging_base/paged_list_view.dart';
import 'cubit/favorite_ads_cubit.dart';

class FavoriteAdsScreen extends StatelessWidget {
  const FavoriteAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorites Ads".tr(context))),
      body: SafeArea(
        child: ScreenPadding(
          child: BlocBuilder<FavoriteAdsCubit, PagingState<Ad>>(
            builder: (context, state) {
              return PagedListView(
                noMoreItemsPlaceholder: (state) {
                  if (state.getCurrentLoadedItems().isEmpty) {
                    return Center(
                      child: Text("No favorites ads found".tr(context)),
                    );
                  }
                  return SizedBox.shrink();
                },
                scrollDirection: Axis.vertical,
                state: state,
                itemBuilder: (ad) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: AdCard(ad: ad),
                  );
                },
                fetchNextPage: () {
                  context.read<FavoriteAdsCubit>().fetchNextPageItems();
                },
                onRefresh: () {
                  context.read<FavoriteAdsCubit>().resetState();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
