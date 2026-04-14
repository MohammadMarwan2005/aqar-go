import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/app_remote_config/app_remote_config.dart';

part 'data_app_remote_config.g.dart';

@JsonSerializable()
class DataAppRemoteConfig {
  final String baseUrl;
  final int notificationFetchInterval;

  const DataAppRemoteConfig({
    required this.baseUrl,
    required this.notificationFetchInterval,
  });

  factory DataAppRemoteConfig.fromJson(Map<String, dynamic> json) =>
      _$DataAppRemoteConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DataAppRemoteConfigToJson(this);

  AppRemoteConfig toDomain() {
    return AppRemoteConfig(
      baseUrl: baseUrl,
      notificationFetchInterval: notificationFetchInterval,
    );
  }
}
