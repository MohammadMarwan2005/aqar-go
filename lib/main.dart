import 'package:aqar_go/common/di/get_it.dart';
import 'package:aqar_go/presentation/routing/app_router.dart';
import 'package:aqar_go/presentation/routing/routing_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final routingUseCase = getIt<RoutingUseCase>();
  firstRoute = await routingUseCase.getFirstRoute();
  // usePathUrlStrategy();
  runApp(const MyApp());
}
