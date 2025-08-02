// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ad_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAdResponse _$CreateAdResponseFromJson(Map<String, dynamic> json) =>
    CreateAdResponse(
      id: (json['id'] as num).toInt(),
      propertyId: (json['property_id'] as num).toInt(),
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$CreateAdResponseToJson(CreateAdResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'property_id': instance.propertyId,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'created_at': instance.createdAt,
    };
