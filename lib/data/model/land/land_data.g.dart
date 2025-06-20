// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'land_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LandData _$LandDataFromJson(Map<String, dynamic> json) => LandData(
  type: json['type'] as String,
  slope: json['slope'] as String,
  isServiced: json['is_serviced'] as bool,
  isInsideMasterPlan: json['is_inside_master_plan'] as bool,
);

Map<String, dynamic> _$LandDataToJson(LandData instance) => <String, dynamic>{
  'type': instance.type,
  'slope': instance.slope,
  'is_serviced': instance.isServiced,
  'is_inside_master_plan': instance.isInsideMasterPlan,
};
