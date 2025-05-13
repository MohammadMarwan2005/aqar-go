import 'package:aqar_go/common/helpers/logging_helper.dart';
import 'package:aqar_go/presentation/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/repo/local_data_repo.dart';
import '../di/get_it.dart';

final LocalDataRepo userDataRepo = getIt();

extension NavigationHelper on BuildContext {
  void pushRoute(String route, {Object? extra}) {
    if (!userDataRepo.hasTokenVar && !Routes.isAllowed(route)) {
      push(
        Routes.login,
        // , extra: PostLoginInstruction(redirectionRoute: route, itsExtras: extra)
      );
      return;
    }
    debugLog('hasToken = ${userDataRepo.hasTokenVar}');
    push(route, extra: extra);
  }

  void goRoute(String route, {Object? extra}) {
    debugLog('hasToken = ${userDataRepo.hasTokenVar}');
    if (!userDataRepo.hasTokenVar && !Routes.isAllowed(route)) {
      push(
        Routes.login,
        // extra: PostLoginInstruction(redirectionRoute: route, itsExtras: extra),
      );
      return;
    }
    go(route, extra: extra);
  }

  void popNavigator() {
    Navigator.pop(this);
  }

  void popRoute() {
    GoRouter.of(this).pop();
  }

  void popThenPushRoute(String route, {Object? extra}) {
    if (GoRouter.of(this).canPop()) GoRouter.of(this).pop();
    pushRoute(route, extra: extra);
  }

  int getSelectedBottomNavBarIndex(List<String> routes) {
    final location = GoRouterState.of(this).uri.toString();
    var index = routes.indexWhere((tab) => location.startsWith(tab));
    if (index == -1) index = 0;
    return index;
  }
}
