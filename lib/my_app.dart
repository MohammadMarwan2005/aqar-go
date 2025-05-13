import 'package:aqar_go/presentation/routing/app_router.dart';
import 'package:aqar_go/presentation/routing/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {

    // todo: after creating the main cubit, getTheFirstRoute() and then use it here
    final initialRoute = Routes.onboarding;

    return MaterialApp(
      title: "AqarGo",
      theme: ThemeData(
        primaryColor: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: initialRoute,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
