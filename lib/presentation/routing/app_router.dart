import 'package:aqar_go/presentation/feature/media_picker/media_picker_cubit.dart';
import 'package:aqar_go/presentation/feature/my_properties/my_properties_screen.dart';
import 'package:aqar_go/presentation/feature/profile/cubit/profile_cubit.dart';
import 'package:aqar_go/presentation/feature/profile/profile_screen.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/model/property.dart';
import '../../presentation/feature/auth/login/login_cubit.dart';
import '../../presentation/feature/auth/login/login_screen.dart';
import '../../presentation/feature/auth/register/register_cubit.dart';
import '../../presentation/feature/auth/register/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../common/di/get_it.dart';
import '../feature/edit_create_post/cubit/edit_create_post_cubit.dart';
import '../feature/edit_create_post/edit_create_post_screen.dart';
import '../feature/my_properties/cubit/my_properties_cubit.dart';
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
    GoRoute(
      path: Routes.createUpdatePost,
      builder: (context, state) {
        final Property? property = state.extra as Property?;
        return MultiBlocProvider(
          providers: [
            BlocProvider<MediaPickerCubit>(
              create:
                  (context) =>
                      MediaPickerCubit(ImagePicker(), initialImages: property?.images),
            ),
            BlocProvider<EditCreatePostCubit>(
              create:
                  (context) => EditCreatePostCubit(getIt(), getIt(), property: property),
            ),
          ],
          child: EditCreatePostScreen(),
        );
      },
    ),
    GoRoute(
      path: Routes.profile,
      builder:
          (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider<MediaPickerCubit>(create: (context) => getIt()),
              BlocProvider<ProfileCubit>(create: (context) => getIt()),
            ],
            child: ProfileScreen(),
          ),
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
  ],
);
