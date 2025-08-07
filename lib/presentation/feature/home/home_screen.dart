import 'package:aqar_go/common/di/get_it.dart';
import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/local_data_repo.dart';
import '../../../domain/model/ad/ad.dart';
import '../../lang/ui/switch_lang_label.dart';
import '../../routing/routes.dart';
import '../../widgets/screen_horizontal_padding.dart';
import '../../widgets/small_ad_card.dart';
import '../near_to_you/cubit/near_to_you_cubit.dart';
import '../paging_base/cubit/paging_cubit.dart';
import '../paging_base/paged_list_view.dart';

final LocalDataRepo _localDataRepo = getIt();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("AqarGo".tr(context)),
      ),
      body: SafeArea(
        child: ScreenPadding(
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<NearToYouCubit>().resetState();
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
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Near To You".tr(context),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                context.pushRoute(Routes.nearToYou);
              },
              child: Text(
                "See All".tr(context),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        BlocBuilder<NearToYouCubit, PagingState<Ad>>(
          builder: (context, state) {
            return PagedListView(
              scrollDirection: Axis.horizontal,
              state: state,
              itemBuilder: (item) {
                return SmallAdCard(
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
      ],
    );
  }
}
