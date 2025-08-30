// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataNotification _$DataNotificationFromJson(Map<String, dynamic> json) =>
    DataNotification(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      adId: (json['ad_id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
      isRead: json['is_read'] as bool,
      type: json['type'] as String,
    );

Map<String, dynamic> _$DataNotificationToJson(DataNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'ad_id': instance.adId,
      'title': instance.title,
      'body': instance.body,
      'is_read': instance.isRead,
      'type': instance.type,
    };
