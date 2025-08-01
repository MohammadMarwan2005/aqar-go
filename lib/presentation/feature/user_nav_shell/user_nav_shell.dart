import 'package:aqar_go/common/helpers/navigation_helper.dart';
import 'package:aqar_go/presentation/widgets/app_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../common/di/get_it.dart';
import '../../routing/routes.dart';
import '../media_picker/media_picker_cubit.dart';
import '../profile/cubit/profile_cubit.dart';
import '../profile/profile_screen.dart';
import '../test/test_screen.dart';

class UserNavShell extends StatelessWidget {
  final Widget child;

  const UserNavShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.getSelectedBottomNavBarIndex(
      NavItemData.userNavItems.toRoutesList(),
    );
    return Scaffold(
      body: child,
      bottomNavigationBar: AppBottomNavBar(
        navBarItems: NavItemData.userNavItems,
        selectedIndex: selectedIndex,
      ),
    );
  }

  static var userGoRoutes = [
    GoRoute(path: Routes.home, builder: (context, state) => TestScreen()),
    GoRoute(
      path: Routes.search,
      builder:
          (context, state) => Scaffold(body: Center(child: Text("Test: Search"))),
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
  ];
}
