import 'package:aqar_go/presentation/feature/maps/cubit/maps_cubit.dart';
import 'package:aqar_go/presentation/feature/media_picker/media_picker_cubit.dart';
import 'package:aqar_go/presentation/feature/my_ads/activate_ads_cubit/activate_ads_cubit.dart';
import 'package:aqar_go/presentation/feature/my_properties/my_properties_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/di/get_it.dart';
import '../../domain/model/property.dart';
import '../../presentation/feature/auth/login/login_cubit.dart';
import '../../presentation/feature/auth/login/login_screen.dart';
import '../../presentation/feature/auth/register/register_cubit.dart';
import '../../presentation/feature/auth/register/register_screen.dart';
import '../feature/create_update_post/create_update_post_screen.dart';
import '../feature/create_update_post/cubit/create_update_post_cubit.dart';
import '../feature/my_ads/cubit/my_ads_cubit.dart';
import '../feature/my_ads/my_ads_screen.dart';
import '../feature/my_properties/cubit/my_properties_cubit.dart';
import '../feature/onboarding/onboarding_screen.dart';
import '../feature/test/test_screen.dart';
import '../feature/user_nav_shell/user_nav_shell.dart';
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
    GoRoute(
      path: Routes.createUpdatePost,
      builder: (context, state) {
        final Property? property = state.extra as Property?;
        return MultiBlocProvider(
          providers: [
            BlocProvider<MediaPickerCubit>(
              create:
                  (context) => MediaPickerCubit(
                    ImagePicker(),
                    initialImages: property?.images,
                  ),
            ),
            BlocProvider<CreateUpdatePostCubit>(
              create:
                  (context) =>
                      CreateUpdatePostCubit(getIt(), getIt(), property: property),
            ),
            BlocProvider<MapsCubit>(create: (context) => getIt()),
          ],
          child: CreateUpdatePostScreen(),
        );
      },
    ),
    GoRoute(
      path: Routes.myProperties,
      builder:
          (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider<MyPropertiesCubit>(create: (context) => getIt()),
            ],
            child: MyPropertiesScreen(),
          ),
    ),
    GoRoute(
      path: Routes.myPublishedAds,
      builder:
          (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider<MyAdsCubit>(create: (context) => getIt()),
              BlocProvider<ActivateAdsCubit>(create: (context) => getIt()),
            ],
            child: MyAdsScreen(),
          ),
    ),
    ShellRoute(
      builder: (context, state, child) => UserNavShell(child: child),
      routes: UserNavShell.userGoRoutes,
    ),
  ],
);
