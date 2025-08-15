import 'package:aqar_go/presentation/feature/ad_details/ad_details_screen.dart';
import 'package:aqar_go/presentation/feature/ad_details/cubit/ad_details_cubit.dart';
import 'package:aqar_go/presentation/feature/check_password_otp/check_password_otp_screen.dart';
import 'package:aqar_go/presentation/feature/near_to_you/cubit/near_to_you_cubit.dart';
import 'package:aqar_go/presentation/feature/near_to_you/near_to_you_screen.dart';
import 'package:aqar_go/presentation/feature/plans/plans_screen.dart';
import 'package:aqar_go/presentation/feature/reset_password/reset_password_screen.dart';
import 'package:aqar_go/presentation/feature/maps/cubit/maps_cubit.dart';
import 'package:aqar_go/presentation/feature/media_picker/media_picker_cubit.dart';
import 'package:aqar_go/presentation/feature/my_ad_details/my_ad_actions_cubit/my_ad_actions_cubit.dart';
import 'package:aqar_go/presentation/feature/my_ad_details/my_ad_details_cubit/my_ad_details_cubit.dart';
import 'package:aqar_go/presentation/feature/my_ads/activate_ads_cubit/activate_ads_cubit.dart';
import 'package:aqar_go/presentation/feature/my_properties/my_properties_screen.dart';
import 'package:aqar_go/presentation/feature/search/filter/search_filter_screen.dart';
import 'package:aqar_go/presentation/feature/verify_email/verify_instruction.dart';
import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/di/get_it.dart';
import '../../domain/model/property.dart';
import '../../domain/model/search/search_filter_settings.dart';
import '../../presentation/feature/auth/login/login_cubit.dart';
import '../../presentation/feature/auth/login/login_screen.dart';
import '../../presentation/feature/auth/register/register_cubit.dart';
import '../../presentation/feature/auth/register/register_screen.dart';
import '../feature/check_password_otp/check_password_otp_args.dart';
import '../feature/check_password_otp/cubit/check_password_otp_cubit.dart';
import '../feature/create_update_post/create_update_post_screen.dart';
import '../feature/create_update_post/cubit/create_update_post_cubit.dart';
import '../feature/my_ad_details/my_ad_details_screen.dart';
import '../feature/my_ads/cubit/my_ads_cubit.dart';
import '../feature/my_ads/my_ads_screen.dart';
import '../feature/my_properties/cubit/my_properties_cubit.dart';
import '../feature/onboarding/onboarding_screen.dart';
import '../feature/plans/cubit/plans_cubit.dart';
import '../feature/privacy_plicy/privacy_policy_screen.dart';
import '../feature/profile/update/update_profile_cubit.dart';
import '../feature/profile/update/update_profile_screen.dart';
import '../feature/reset_password/cubit/reset_password_cubit.dart';
import '../feature/search/filter/cubit/search_filter_cubit.dart';
import '../feature/search/results/cubit/search_results_cubit.dart';
import '../feature/search/results/search_results_screen.dart';
import '../feature/test/test_screen.dart';
import '../feature/user_nav_shell/user_nav_shell.dart';
import '../feature/verify_email/cubit/verify_email_cubit.dart';
import '../feature/verify_email/verify_email_screen.dart';
import '../lang/ui/language_screen.dart';
import '../routing/routes.dart';
import '../theme/ui/theme_screen.dart';
import 'guest_mode/post_login_instruction.dart';

final GlobalKey<NavigatorState> goRouteRootNavigatorKey =
    GlobalKey<NavigatorState>();

String firstRoute = Routes.onboarding;

final appRouter = GoRouter(
  navigatorKey: goRouteRootNavigatorKey,
  initialLocation: firstRoute,
  routes: [
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => OnboardingScreen(localDataRepo: getIt()),
    ),
    GoRoute(
      path: Routes.privacyPolicy,
      builder: (context, state) => PrivacyPolicyScreen(),
    ),
    GoRoute(
      path: Routes.plans,
      builder: (context, state) {
        final isPremium = state.extra as bool;
        return BlocProvider<PlansCubit>(
          create: (context) => PlansCubit(isPremium: isPremium),
          child: PlansScreen(),
        );
      },
    ),
    GoRoute(
      path: Routes.nearToYou,
      builder: (context, state) {
        return BlocProvider<NearToYouCubit>(
          create: (context) => NearToYouCubit(getIt(), getIt()),
          child: NearToYouScreen(),
        );
      },
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) {
        final postLoginInstructions = state.extra as PostLoginInstruction?;
        return BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: LoginScreen(postLoginInstruction: postLoginInstructions),
        );
      },
    ),
    GoRoute(
      path: Routes.register,
      builder: (context, state) {
        final postLoginInstructions = state.extra as PostLoginInstruction?;
        return BlocProvider(
          create: (context) => getIt<RegisterCubit>(),
          child: RegisterScreen(postLoginInstruction: postLoginInstructions),
        );
      },
    ),
    GoRoute(path: Routes.test, builder: (context, state) => TestScreen()),
    GoRoute(path: Routes.theme, builder: (context, state) => ThemeScreen()),
    GoRoute(
      path: Routes.language,
      builder: (context, state) => LanguageScreen(),
    ),
    GoRoute(
      path: Routes.verifyEmail,
      builder: (context, state) {
        final verifyInstruction = state.extra as VerifyInstruction;
        return BlocProvider<VerifyEmailCubit>(
          create:
              (context) => VerifyEmailCubit(
                getIt(),
                verifyInstruction: verifyInstruction,
              ),
          child: VerifyEmailScreen(),
        );
      },
    ),
    GoRoute(
      path: Routes.forgotPassword,
      builder:
          (context, state) => BlocProvider<ResetPasswordCubit>(
            create: (context) => getIt(),
            child: ResetPasswordScreen(),
          ),
    ),
    GoRoute(
      path: Routes.checkPasswordOTP,
      builder: (context, state) {
        final checkPasswordOtpArgs = state.extra as CheckPasswordOtpArgs;
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create:
                  (context) => CheckPasswordOtpCubit(
                    getIt(),
                    getIt(),
                    checkPasswordOtpArgs: checkPasswordOtpArgs,
                  ),
            ),
            BlocProvider<ResetPasswordCubit>(create: (context) => getIt()),
          ],
          child: CheckPasswordOtpScreen(),
        );
      },
    ),
    GoRoute(
      path: Routes.updateProfile,
      builder:
          (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider<MediaPickerCubit>(create: (context) => getIt()),
              BlocProvider<UpdateProfileCubit>(create: (context) => getIt()),
            ],
            child: UpdateProfileScreen(),
          ),
    ),
    GoRoute(
      path: Routes.myAdDetails,
      builder: (context, state) {
        final id = state.extractIdParam("id");
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => MyAdDetailsCubit(id, getIt())),
            BlocProvider(create: (context) => MyAdActionsCubit(id, getIt())),
          ],
          child: MyAdDetailsScreen(),
        );
      },
    ),
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
                  (context) => CreateUpdatePostCubit(
                    getIt(),
                    getIt(),
                    property: property,
                  ),
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
    GoRoute(
      path: Routes.viewAd,
      builder: (context, state) {
        final id = state.extractIdParam("id");
        return BlocProvider<AdDetailsCubit>(
          create: (context) => AdDetailsCubit(id, getIt()),
          child: AdDetailsScreen(),
        );
      },
    ),
    GoRoute(
      path: Routes.searchResults,
      builder: (context, state) {
        final settings = state.extra as SearchFilterSettings;
        return BlocProvider<SearchResultsCubit>(
          create: (context) => SearchResultsCubit(getIt(), settings),
          child: SearchResultsScreen(),
        );
      },
    ),
    GoRoute(
      path: Routes.searchFilters,
      builder: (context, state) {
        final passedSettings = state.extra as SearchFilterSettings?;
        return BlocProvider<SearchFilterCubit>(
          create: (context) => SearchFilterCubit(passedSettings),
          child: SearchFilterScreen(),
        );
      },
    ),
  ],
);
