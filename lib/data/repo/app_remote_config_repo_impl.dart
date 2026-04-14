import 'dart:convert';
import 'package:aqar_go/common/helpers/logging_helper.dart';
import 'package:aqar_go/data/api/api_constants.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../domain/model/app_remote_config/app_remote_config.dart';
import '../../domain/repo/app_remote_config_repo.dart';
import '../model/app_remote_config/data_app_remote_config.dart';

class AppRemoteConfigRepoImpl implements AppRemoteConfigRepo {
  final FirebaseRemoteConfig _remoteConfig;

  late AppRemoteConfig _config;

  AppRemoteConfigRepoImpl(this._remoteConfig);

  @override
  Future<void> init() async {
    await _remoteConfig.setDefaults({
      'remote_config_json': jsonEncode({
        "baseUrl": APIConstants.odlDefaultBaseUrl,
        "notificationFetchInterval": 10,
      }),
    });

    await _remoteConfig.fetchAndActivate();

    final raw = _remoteConfig.getString('remote_config_json');

    final Map<String, dynamic> map =
    jsonDecode(raw.isNotEmpty ? raw : '{}');

    _config = DataAppRemoteConfig.fromJson(map).toDomain();
  }

  @override
  AppRemoteConfig get config => _config;
}