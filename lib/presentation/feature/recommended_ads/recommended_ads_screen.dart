import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/model/ad/ad.dart';
import '../../widgets/ad_card.dart';
import '../../widgets/screen_horizontal_padding.dart';
import '../paging_base/cubit/paging_cubit.dart';
import '../paging_base/paged_list_view.dart';
import 'cubit/recommended_ads_cubit.dart';

class RecommendedAdsScreen extends StatelessWidget {
  const RecommendedAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recommended".tr(context))),
      body: SafeArea(
        child: ScreenPadding(
          child: BlocBuilder<RecommendedAdsCubit, PagingState<Ad>>(
            builder: (context, state) {
              return PagedListView(
                scrollDirection: Axis.vertical,
                state: state,
                itemBuilder: (ad) {
                  return AdCard(ad: ad);
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
        ),
      ),
    );
  }
}
