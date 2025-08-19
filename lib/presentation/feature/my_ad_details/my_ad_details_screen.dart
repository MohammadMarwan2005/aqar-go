import 'package:aqar_go/presentation/helper/ui_helper.dart';
import 'package:aqar_go/presentation/feature/my_ad_details/my_ad_actions_cubit/my_ad_actions_cubit.dart';
import 'package:aqar_go/presentation/feature/my_ad_details/my_ad_details_cubit/my_ad_details_cubit.dart';
import 'package:aqar_go/presentation/helper/date_time_helper.dart';
import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/widgets/screen_horizontal_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/model/ad/ad.dart';
import '../../../domain/model/media_file.dart';
import '../../../domain/model/property.dart';
import '../../widgets/ad_primary_info.dart';
import '../../widgets/ad_secondary_info.dart';
import '../../widgets/app_button.dart';
import '../../widgets/error_message.dart';
import '../../widgets/images_slider.dart';
import '../../widgets/loading_screen.dart';
import '../my_ads/cubit/my_ads_cubit.dart';

class MyAdDetailsScreen extends StatelessWidget {
  const MyAdDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Ad Details".tr(context)), actions: []),
      body: SafeArea(
        child: BlocBuilder<MyAdDetailsCubit, MyAdDetailsState>(
          builder: (context, state) {
            return state.when(
              loading: () => LoadingScreen(),
              error:
                  (domainError) => ErrorMessage(
                    error: domainError,
                    onTryAgain: () {
                      context.read<MyAdDetailsCubit>().fetchMyAd();
                    },
                  ),
              success: (ad) => _MyAdDetailsContent(ad: ad),
            );
          },
        ),
      ),
    );
  }
}

class _MyAdDetailsContent extends StatelessWidget {
  final Ad ad;

  const _MyAdDetailsContent({super.key, required this.ad});

  @override
  Widget build(BuildContext context) {
    final property = ad.property;
    final expirationText =
        ad.isExpired
            ? "${"Expired on".tr(context)} ${ad.expirationDateUTC.toLocal().formatToShortDateWithHour()}"
            : "${"Expires on".tr(context)} ${ad.expirationDateUTC.toLocal().formatToShortDateWithHour()}";

    return Scaffold(
      bottomNavigationBar: _MyAdActionsWidget(ad: ad),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImagesSlider.fromFiles(files: ad.property.images),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AdPrimaryInfo(ad: ad, isLocationLink: true),
            ),
            Divider(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AdSecondaryInfo(propertable: property.propertable),
            ),
          ],
        ),
      ),
    );
  }
}

class _MyAdActionsWidget extends StatelessWidget {
  final Ad ad;

  const _MyAdActionsWidget({required this.ad});

  @override
  Widget build(BuildContext context) {
    final myAdActionsCubit = context.read<MyAdActionsCubit>();
    final myAdDetailsCubit = context.read<MyAdDetailsCubit>();
    return BlocConsumer<MyAdActionsCubit, MyAdActionsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButton(
                isLoading:
                    state.isLoadingActivating() ||
                    state.isLoadingDeactivating(),
                onPressed: () {
                  myAdActionsCubit.doAction(
                    ad.isActive ? MyAdAction.deactivate : MyAdAction.activate,
                  );
                },
                text:
                    ad.isActive
                        ? "Deactivate".tr(context)
                        : "Activate".tr(context),
              ),
              SizedBox(height: 8),
              AppButton(
                isSecondary: true,
                isLoading: state.isLoadingDeleting(),
                onPressed: () {
                  context.showMyAlertDialog(
                    "Delete Ad".tr(context),
                    ["Are you sure you want to delete this ad?".tr(context)],
                    true,
                    gotItPlaceholder: "Cancel".tr(context),
                    firstAction: TextButton(
                      onPressed: () {
                        context.pop();
                        myAdActionsCubit.doAction(MyAdAction.delete);
                      },
                      child: Text("Delete Ad".tr(context)),
                    ),
                  );
                },
                text: "Delete Ad".tr(context),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: (myAdAction) {},
          error: (error, myAdAction) {
            context.showMyAlertDialogFromDomainError(error);
          },
          success: (myAdAction) {
            try {
              // the cubit is provided it will update the list
              context.read<MyAdsCubit>().getMyAds();
            } catch (_) {}
            final message = _getMessage(context, myAdAction);
            context.showMyAlertDialog(
              "Done".tr(context),
              [message],
              false,
              onGotItClicked: () {
                switch (myAdAction) {
                  case MyAdAction.activate:
                    myAdDetailsCubit.fetchMyAd();
                  case MyAdAction.deactivate:
                    myAdDetailsCubit.fetchMyAd();
                  case MyAdAction.delete:
                    context.popRoute();
                    context.showMySnackBar(
                      "Ad deleted successfully!".tr(context),
                    );
                    context.popRoute();
                }
              },
            );
          },
        );
      },
    );
  }

  String _getMessage(BuildContext context, MyAdAction action) {
    switch (action) {
      case MyAdAction.activate:
        return "Ad Activated".tr(context);
      case MyAdAction.deactivate:
        return "Ad Deactivated".tr(context);
      case MyAdAction.delete:
        return "Ad Deleted".tr(context);
    }
  }
}
