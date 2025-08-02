// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdData _$AdDataFromJson(Map<String, dynamic> json) => AdData(
  id: (json['id'] as num).toInt(),
  propertyId: (json['property_id'] as num).toInt(),
  propertyData: PropertyData.fromJson(json['property'] as Map<String, dynamic>),
  isActive: json['is_active'] as bool,
  views: (json['views'] as num).toInt(),
  startDate: json['start_date'] as String,
  endDate: json['end_date'] as String,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$AdDataToJson(AdData instance) => <String, dynamic>{
  'id': instance.id,
  'property_id': instance.propertyId,
  'is_active': instance.isActive,
  'views': instance.views,
  'start_date': instance.startDate,
  'end_date': instance.endDate,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'property': instance.propertyData,
};
