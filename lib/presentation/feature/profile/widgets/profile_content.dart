import 'package:aqar_go/presentation/feature/plans/cubit/plans_cubit.dart';
import 'package:aqar_go/presentation/feature/profile/show/profile_cubit.dart';
import 'package:aqar_go/presentation/feature/profile/widgets/profile_avatar.dart';
import 'package:aqar_go/presentation/feature/profile/widgets/settings_list_item.dart';
import 'package:aqar_go/presentation/feature/telegram_link/telegram_link_cubit.dart';
import 'package:aqar_go/presentation/feature/verify_email/verify_instruction.dart';
import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/helper/ui_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/model/profile/user_profile.dart';
import '../../../assets/assets.gen.dart';
import '../../../helper/url_helper.dart';

class ProfileContent extends StatelessWidget {
  final UserProfile userProfile;

  const ProfileContent({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileAvatar(
          onEditPressed: () {
            final cubit = context.read<ProfileCubit>();
            context.pushRoute(Routes.updateProfile, extra: cubit);
          },
          isPremium: userProfile.isPremium,
          imageUrl: userProfile.imageUrl,
          pickedImagePath: null,
        ),
        Text(
          userProfile.firstName,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Center(
          child: _buildEmailVerificationStatus(userProfile.isVerified, context),
        ),
        SizedBox(height: 32),
        SettingsListItem(
          iconAsset: Assets.svgs.land.path,
          title: "My Properties".tr(context),
          onTap: () {
            context.pushRoute(Routes.myProperties);
          },
        ),
        SettingsListItem(
          iconAsset: Assets.svgs.land.path,
          title: "My Published Ads".tr(context),
          onTap: () {
            context.pushRoute(Routes.myPublishedAds);
          },
        ),
        SettingsListItem(
          iconData: Icons.favorite_border,
          title: "Favorites".tr(context),
          onTap: () {
            context.pushRoute(Routes.favoriteAds);
          },
        ),
        // SettingsListItem(
        //   iconAsset: Assets.svgs.notificationSettings.path,
        //   title: "Notification Preferences".tr(context),
        //   onTap: () {},
        // ),
        if (!userProfile.isVerified)
          SettingsListItem(
            iconAsset: Assets.svgs.markEmailRead.path,
            title: "Email Verification".tr(context),
            onTap: () {
              context.pushRoute(
                Routes.verifyEmail,
                extra: VerifyInstruction(afterLogin: false),
              );
            },
          ),
        SettingsListItem(
          iconAsset: Assets.svgs.diamond.path,
          title: "Free & Paid Plans".tr(context),
          onTap: () {
            context.pushRoute(
              Routes.plans,
              extra: PlansScreenArgs(
                isPremium: userProfile.isPremium,
                profileCubit: context.read<ProfileCubit>(),
              ),
            );
          },
        ),
        SettingsListItem(
          iconAsset: Assets.svgs.language.path,
          title: "App Language".tr(context),
          onTap: () {
            context.pushRoute(Routes.language);
          },
        ),
        SettingsListItem(
          iconAsset: Assets.svgs.themeContrast.path,
          title: "App Theme".tr(context),
          onTap: () {
            context.pushRoute(Routes.theme);
          },
        ),
        SettingsListItem(
          iconAsset: Assets.svgs.policy.path,
          title: "Privacy Policy".tr(context),
          onTap: () {
            context.pushRoute(Routes.privacyPolicy);
          },
        ),
        SettingsListItem(
          iconAsset: Assets.svgs.telegram.path,
          title: "Follow us on Telegram".tr(context),
          onTap: () {
            openUrl(context.read<TelegramLinkCubit>().state.getLink(), () {
              context.showMySnackBar("Failed to open this link!".tr(context));
            });
          },
        ),
      ],
    );
  }

  void _showNotImplementedYet(BuildContext context) {
    context.showMySnackBar("Not implemented yet!".tr(context));
  }

  Widget _buildEmailVerificationStatus(
    bool isEmailVerified,
    BuildContext context,
  ) {
    if (isEmailVerified) {
      return _buildIconWithText(
        Icon(Icons.check, color: Colors.green, size: 16),
        "Email Verified".tr(context),
      );
    } else {
      return _buildIconWithText(
        Icon(Icons.close, color: Colors.red, size: 16),
        "Email not verified yet".tr(context),
        action: TextButton(
          onPressed: () {
            context.pushRoute(
              Routes.verifyEmail,
              extra: VerifyInstruction(afterLogin: false),
            );
          },
          child: Text("Verify".tr(context)),
        ),
      );
    }
  }

  Widget _buildIconWithText(Widget icon, String text, {Widget? action}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        SizedBox(width: 8),
        Text(text),
        if (action != null) ...[SizedBox(width: 8), action],
      ],
    );
  }
}
