import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/lang/ui/switch_lang_label.dart';
import 'package:aqar_go/presentation/routing/routes.dart';
import 'package:aqar_go/presentation/theme/ui/switch_theme_widget.dart';
import 'package:aqar_go/presentation/widgets/app_button.dart';
import 'package:aqar_go/presentation/widgets/screen_horizontal_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../domain/repo/local_data_repo.dart';
import '../../assets/assets.gen.dart';

class OnboardingScreen extends StatelessWidget {
  final LocalDataRepo localDataRepo;

  const OnboardingScreen({super.key, required this.localDataRepo});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final imageHeight = height * 0.35;
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ScreenPadding(
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: theme.colorScheme.primary,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8, top: 4),
                            child: SvgPicture.asset(
                              Assets.svgs.logo.path,
                              // height: 32,
                              // width: 32,
                              colorFilter: ColorFilter.mode(
                                theme.colorScheme.onPrimary,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "AqarGo".tr(context),
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        SwitchThemeWidget(),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  height: imageHeight,
                  "assets/images/onboard.png",
                  fit: BoxFit.cover,
                ),
              ),
              ScreenPadding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Discover Your Dream Property".tr(context),
                      style: theme.textTheme.displaySmall?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Find the perfect property with ease. Explore, compare and connect with trusted agents all in one app"
                          .tr(context),
                      style: theme.textTheme.bodyLarge,
                    ),
                    SizedBox(height: 32),
                    AppButton(
                      onPressed: () {
                        localDataRepo.setOnboarded();
                        context.goRoute(Routes.login);
                      },
                      text: "Login".tr(context),
                    ),
                    SizedBox(height: 16),
                    AppButton(
                      isSecondary: true,
                      onPressed: () {
                        localDataRepo.setOnboarded();
                        context.goRoute(Routes.home);
                      },
                      text: "Continue as Guest".tr(context),
                    ),
                    SizedBox(height: 16),
                    Center(child: SwitchLangLabel()),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              // Text("Welcome to AqarGo".tr(context)),
              // SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
