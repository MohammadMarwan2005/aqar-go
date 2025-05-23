import 'package:aqar_go/common/helpers/navigation_helper.dart';
import 'package:aqar_go/presentation/routing/routes.dart';
import 'package:aqar_go/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Onboarding"),
        AppButton(onPressed: () {
          context.goRoute(Routes.login);
        }, text: "Go to Login")
      ],
    ));
  }
}
