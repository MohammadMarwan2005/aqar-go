import 'package:aqar_go/presentation/feature/auth/widgets/auth_suggestion.dart';
import 'package:aqar_go/presentation/feature/report/report_bottom_sheet.dart';
import 'package:aqar_go/presentation/helper/ui_helper.dart';
import 'package:aqar_go/presentation/helper/url_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/widgets/ad_primary_info.dart';
import 'package:aqar_go/presentation/widgets/ad_secondary_info.dart';
import 'package:aqar_go/presentation/widgets/images_slider.dart';
import 'package:aqar_go/presentation/widgets/screen_horizontal_padding.dart';
import 'package:aqar_go/presentation/widgets/share_deep_link_icon.dart';
import 'package:aqar_go/presentation/widgets/up_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../domain/model/ad/ad.dart';
import '../../../domain/model/profile/user_profile.dart';
import '../../../domain/model/property.dart';
import '../../assets/assets.gen.dart';
import '../../widgets/error_message.dart';
import '../../widgets/loading_screen.dart';
import '../report/cubit/report_cubit.dart';
import 'cubit/ad_details_cubit.dart';

class AdDetailsScreen extends StatelessWidget {
  const AdDetailsScreen({super.key});

  Widget _buildWhenReport({
    required BuildContext context,
    required Widget Function() isReportSheetOpen,
    required Widget Function() isReportSheetClosed,
  }) {
    return ValueListenableBuilder<bool>(
      valueListenable: context.read<ReportCubit>().isReportSheetOpen,
      builder: (context, isOpen, _) {
        switch (isOpen) {
          case true:
            return isReportSheetOpen();
          case false:
            return isReportSheetClosed();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _buildWhenReport(
          context: context,
          isReportSheetOpen:
              () => IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(Icons.close),
              ),
          isReportSheetClosed: () => UpButton(),
        ),
        title: _buildWhenReport(
          context: context,
          isReportSheetOpen: () => Text("Report Ad".tr(context)),
          isReportSheetClosed: () => Text("Ad Details".tr(context)),
        ),
        actions: [
          _buildWhenReport(
            context: context,
            isReportSheetOpen: () => SizedBox.shrink(),
            isReportSheetClosed: () => const ShareDeepLinkIcon(),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<AdDetailsCubit, AdDetailsState>(
          builder: (context, state) {
            return state.when(
              loading: () => LoadingScreen(),
              error:
                  (domainError) => ErrorMessage(
                    error: domainError,
                    onTryAgain: () {
                      context.read<AdDetailsCubit>().fetchAd();
                    },
                  ),
              success: (ad) => _AdDetailsContent(ad: ad),
            );
          },
        ),
      ),
    );
  }
}

class _AdDetailsContent extends StatelessWidget {
  final Ad ad;

  const _AdDetailsContent({required this.ad});

  @override
  Widget build(BuildContext context) {
    final reportCubit = context.read<ReportCubit>();
    final property = ad.property;
    return Scaffold(
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
            SizedBox(height: 16),
            ScreenPadding(child: _OwnerInfo(profile: ad.property.userProfile)),
            SizedBox(height: 48),
            AuthSuggestion(
              suggestionText: "Inappropriate content?".tr(context),
              buttonLabel: "Report Ad".tr(context),
              onClick: () {
                final controller = showBottomSheet(
                  context: context,
                  builder:
                      (context) => BlocProvider.value(
                        value: reportCubit,
                        child: ReportBottomSheet(),
                      ),
                );
                controller.closed.then((_) {
                  reportCubit.isSheetOpen = false;
                });
                reportCubit.isSheetOpen = true;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _OwnerInfo extends StatelessWidget {
  final UserProfile? profile;

  const _OwnerInfo({this.profile});

  @override
  Widget build(BuildContext context) {
    if (profile == null) {
      return Text("Owner info is not available!".tr(context));
    }
    return Row(
      children: [
        _ProfileImage(imageUrl: profile?.imageUrl),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${profile?.firstName ?? ""} ${profile?.lastName ?? ""} ",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              profile!.phoneNumber,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            openUrl(getCallUrl(profile?.phoneNumber ?? ""), () {
              _failedToOpenUrl(context);
            });
          },
          icon: Icon(Icons.call),
        ),
        IconButton(
          onPressed: () {
            openUrl(getWhatsappUrl(profile?.phoneNumber ?? ""), () {
              _failedToOpenUrl(context);
            });
          },
          icon: SvgPicture.asset(Assets.svgs.whatsappLogo2.path, height: 24),
        ),
      ],
    );
  }

  _failedToOpenUrl(BuildContext context) {
    context.showMySnackBar("Failed to open this link!".tr(context));
  }
}

class _ProfileImage extends StatelessWidget {
  final String? imageUrl;

  const _ProfileImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final doubleRadius = 48.0;
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: doubleRadius / 2 + 10,
      child: ClipOval(
        clipBehavior: Clip.antiAlias,
        child:
            (imageUrl != null)
                ? Image.network(
                  imageUrl!,
                  width: doubleRadius,
                  height: doubleRadius,
                  fit: BoxFit.cover,
                )
                // todo: use flutter gen
                : Image.asset(
                  "assets/images/profile_image_placeholder.png",
                  width: doubleRadius,
                  height: doubleRadius,
                  fit: BoxFit.cover,
                ),
      ),
    );
  }
}
