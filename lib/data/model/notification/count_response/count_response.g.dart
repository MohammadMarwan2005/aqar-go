// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationCountResponse _$NotificationCountResponseFromJson(
  Map<String, dynamic> json,
) => NotificationCountResponse((json['unread_count'] as num).toInt());

Map<String, dynamic> _$NotificationCountResponseToJson(
  NotificationCountResponse instance,
) => <String, dynamic>{'unread_count': instance.count};
