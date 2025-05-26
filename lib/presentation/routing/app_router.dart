import 'package:aqar_go/presentation/feature/auth/login/login_cubit.dart';
import 'package:aqar_go/presentation/feature/auth/login/login_screen.dart';
import 'package:aqar_go/presentation/feature/auth/register/register_cubit.dart';
import 'package:aqar_go/presentation/feature/auth/register/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../common/di/get_it.dart';
import '../feature/onboarding/onboarding_screen.dart';
import '../feature/test/test_screen.dart';
import '../routing/routes.dart';

final GlobalKey<NavigatorState> goRouteRootNavigatorKey =
    GlobalKey<NavigatorState>();

String firstRoute = Routes.onboarding;

final appRouter = GoRouter(
  navigatorKey: goRouteRootNavigatorKey,
  initialLocation: firstRoute,
  routes: [
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => OnboardingScreen(),
    ),
    GoRoute(
      path: Routes.login,
      builder:
          (context, state) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
    ),
    GoRoute(
      path: Routes.register,
      builder:
          (context, state) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: RegisterScreen(),
          ),
    ),
    GoRoute(path: Routes.test, builder: (context, state) => TestScreen()),
    GoRoute(path: Routes.home, builder: (context, state) => TestScreen()),
  ],
);
