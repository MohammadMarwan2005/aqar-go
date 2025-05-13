import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../feature/onboarding/onboarding_screen.dart';
import '../feature/test/test_screen.dart';
import '../routing/routes.dart';

final GlobalKey<NavigatorState> goRouteRootNavigatorKey =
    GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: goRouteRootNavigatorKey,
  initialLocation: Routes.test,
  routes: [
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => OnboardingScreen(),
    ),
    GoRoute(path: Routes.test, builder: (context, state) => TestScreen()),
  ],
);
