import 'package:aqar_go/presentation/feature/onboarding/onboarding_screen.dart';
import 'package:aqar_go/presentation/routing/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      default:
        return null;
    }
  }
}
