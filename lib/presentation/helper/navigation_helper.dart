import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// final UserDataRepo userDataRepo = getIt();
extension NavigationHelper on BuildContext {

  void pushRoute(String route, {Object? extra}) {
    // if(!userDataRepo.hasTokenVar && !AppRoutes.isAllowed(route)) {
    //   push(AppRoutes.login, extra: PostLoginInstruction(redirectionRoute: route, itsExtras: extra));
    //   return;
    // }
    // print('hasToken = ${userDataRepo.hasTokenVar}');
    push(route, extra: extra);
  }

  void goRoute(String route, {Object? extra}) {
    // print('hasToken = ${userDataRepo.hasTokenVar}');
    // if(!userDataRepo.hasTokenVar && !AppRoutes.isAllowed(route)) {
    //   push(AppRoutes.login, extra: PostLoginInstruction(redirectionRoute: route, itsExtras: extra));
    //   return;
    // }
    go(route, extra: extra);
  }

  void pop() {
    Navigator.pop(this);
  }

  void popRoute() {
    GoRouter.of(this).pop();
  }

  void popThenPushRoute(String route, {Object? extra}) {
    if(GoRouter.of(this).canPop()) GoRouter.of(this).pop();
    pushRoute(route, extra: extra);
  }

  int getSelectedBottomNavBarIndex(List<String> routes) {
    final location = GoRouterState.of(this).uri.toString();
    var index = routes.indexWhere((tab) => location.startsWith(tab));
    if(index == -1) index = 0;
    return index;
  }
}

extension GoRouterStateX on GoRouterState {
  int extractIdParam(String key) =>
      int.tryParse(pathParameters[key] ?? '') ?? -1;
}
