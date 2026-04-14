import 'package:aqar_go/domain/model/app_remote_config/app_remote_config.dart';

abstract class AppRemoteConfigRepo {
  Future<void> init();

  AppRemoteConfig get config;
}
