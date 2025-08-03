import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/helper/ui_helper.dart';
import 'package:aqar_go/presentation/feature/profile/widgets/settings_list_item.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/routing/routes.dart';
import 'package:flutter/material.dart';

import '../../../../domain/model/profile/user_profile.dart';
import '../../../assets/assets.gen.dart';

class ProfileContent extends StatelessWidget {
  final UserProfile userProfile;

  const ProfileContent({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context) {
    final double doubleRadius = 120;

    return Column(
      children: [
        Center(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: doubleRadius / 2 + 10,
                child: ClipOval(
                  clipBehavior: Clip.antiAlias,
                  child:
                      (userProfile.imageUrl != null)
                          ? Image.network(
                            userProfile.imageUrl!,
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
              ),
              IconButton(
                onPressed: () {
                  _showNotImplementedYet(context);
                },
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
        Text(
          userProfile.firstName,
          style: Theme.of(context).textTheme.titleLarge,
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
          iconAsset: Assets.svgs.notificationSettings.path,
          title: "Notification Preferences".tr(context),
          onTap: () {
          },
        ),
        SettingsListItem(
          iconAsset: Assets.svgs.markEmailRead.path,
          title: "Email Verification".tr(context),
          onTap: () {
          },
        ),
        SettingsListItem(
          iconAsset: Assets.svgs.language.path,
          title: "App Language".tr(context),
          onTap: () {

          },
        ),
        SettingsListItem(
          iconAsset: Assets.svgs.themeContrast.path,
          title: "App Theme".tr(context),
          onTap: () {
          },
        ),
      ],
    );
  }

  void _showNotImplementedYet(BuildContext context) {
    context.showMySnackBar("Not implemented yet!".tr(context));
  }
}
