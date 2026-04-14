// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_app_remote_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataAppRemoteConfig _$DataAppRemoteConfigFromJson(Map<String, dynamic> json) =>
    DataAppRemoteConfig(
      baseUrl: json['baseUrl'] as String,
      notificationFetchInterval:
          (json['notificationFetchInterval'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataAppRemoteConfigToJson(
  DataAppRemoteConfig instance,
) => <String, dynamic>{
  'baseUrl': instance.baseUrl,
  'notificationFetchInterval': instance.notificationFetchInterval,
};
