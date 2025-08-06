import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/routing/routes.dart';
import 'package:aqar_go/presentation/widgets/app_button.dart';
import 'package:aqar_go/presentation/widgets/screen_horizontal_padding.dart';
import 'package:flutter/material.dart';

import '../../../data/repo/local_data_repo.dart';

class OnboardingScreen extends StatelessWidget {
  final LocalDataRepo localDataRepo;
  const OnboardingScreen({super.key, required this.localDataRepo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to AqarGo".tr(context)),
            SizedBox(height: 32),
            AppButton(
              onPressed: () {
                localDataRepo.setOnboarded();
                context.goRoute(Routes.login);
              },
              text: "Login".tr(context),
            ),
            SizedBox(height: 32),
            AppButton(
              onPressed: () {
                localDataRepo.setOnboarded();
                context.goRoute(Routes.home);
              },
              text: "Continue as Guest".tr(context),
            ),
          ],
        ),
      ),
    );
  }
}
