import 'package:aqar_go/common/di/get_it.dart';
import 'package:aqar_go/presentation/routing/app_router.dart';
import 'package:aqar_go/presentation/routing/routing_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'data/repo/local_data_repo.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await di();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final LocalDataRepo localDataRepo = getIt<LocalDataRepo>();
  localDataRepo.deleteEverything();
  final routingUseCase = getIt<RoutingUseCase>();
  firstRoute = await routingUseCase.getFirstRoute();
  // usePathUrlStrategy();
  runApp(const MyApp());
}
