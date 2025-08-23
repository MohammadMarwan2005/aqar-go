// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIError _$APIErrorFromJson(Map<String, dynamic> json) => APIError(
  json['message'] as String,
  (json['status'] as num).toInt(),
  (json['data'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as List<dynamic>),
  ),
  (json['params'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
);

Map<String, dynamic> _$APIErrorToJson(APIError instance) => <String, dynamic>{
  'message': instance.message,
  'status': instance.status,
  'data': instance.data,
  'params': instance.params,
};
