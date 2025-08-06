import 'package:aqar_go/presentation/helper/ui_helper.dart';
import 'package:aqar_go/presentation/feature/my_ads/activate_ads_cubit/activate_ads_cubit.dart';
import 'package:aqar_go/presentation/feature/my_ads/my_ad_card.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/widgets/app_button.dart';
import 'package:aqar_go/presentation/widgets/error_message.dart';
import 'package:aqar_go/presentation/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/model/ad/ad.dart';
import '../../routing/routes.dart';
import '../../widgets/screen_horizontal_padding.dart';
import 'cubit/my_ads_cubit.dart';

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Published Ads".tr(context)), actions: []),
      body: SafeArea(
        child: BlocBuilder<MyAdsCubit, MyAdsState>(
          builder: (context, state) {
            return state.when(
              loading: () => LoadingScreen(),
              error:
                  (domainError) => ErrorMessage(
                    error: domainError,
                    onTryAgain: () {
                      context.read<MyAdsCubit>().getMyAds();
                    },
                  ),
              success: (ads) => _MyAdsContent(ads: ads),
            );
          },
        ),
      ),
    );
  }
}

class _MyAdsContent extends StatelessWidget {
  final List<Ad> ads;

  const _MyAdsContent({super.key, required this.ads});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelColor: Theme.of(context).colorScheme.primary,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Theme.of(context).colorScheme.primary,
            tabs: [
              Tab(text: "All Ads".tr(context)),
              Tab(text: "Active".tr(context)),
              Tab(text: "Expired".tr(context)),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _MyAdsList(myAds: ads, showActivateAllButton: true),
                _MyAdsList(myAds: ads.where((ad) => ad.isActive).toList()),
                _MyAdsList(myAds: ads.where((ad) => !ad.isActive).toList()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MyAdsList extends StatelessWidget {
  final bool showActivateAllButton;
  final List<Ad> myAds;

  const _MyAdsList({
    super.key,
    required this.myAds,
    this.showActivateAllButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenPadding(
      vertical: 8,
      child: Scaffold(
        bottomNavigationBar:
            (showActivateAllButton) ? _ActivateAllButton() : null,
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<MyAdsCubit>().getMyAds();
          },
          child:
              (myAds.isEmpty)
                  ? Center(child: Text("No Ads Found!".tr(context)))
                  : ListView.builder(
                    itemCount: myAds.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: MyAdCard(
                          ad: myAds[index],
                          onTap: () {
                            context.push(Routes.getMyAdDetails(myAds[index].id));
                          },
                        ),
                      );
                    },
                  ),
        ),
      ),
    );
  }
}

class _ActivateAllButton extends StatelessWidget {
  const _ActivateAllButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ActivateAdsCubit, ActivateAdsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: AppButton(
            onPressed: () {
              context.read<ActivateAdsCubit>().activateAd();
            },
            isLoading: state.isLoading(),
            text: "Activate All".tr(context),
          ),
        );
      },
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
          error: (error) {
            context.showMyAlertDialogFromDomainError(error);
          },
          success: () {
            context.showMyAlertDialog("Ads Activated".tr(context), [
              "All ads are activated successfully!".tr(context),
            ], false);
          },
        );
      },
    );
  }
}
