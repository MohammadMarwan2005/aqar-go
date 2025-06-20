// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopData _$ShopDataFromJson(Map<String, dynamic> json) => ShopData(
  floor: (json['floor'] as num).toInt(),
  type: json['type'] as String,
  hasWarehouse: json['has_warehouse'] as bool,
  hasBathroom: json['has_bathroom'] as bool,
  hasAc: json['has_ac'] as bool,
);

Map<String, dynamic> _$ShopDataToJson(ShopData instance) => <String, dynamic>{
  'floor': instance.floor,
  'type': instance.type,
  'has_warehouse': instance.hasWarehouse,
  'has_bathroom': instance.hasBathroom,
  'has_ac': instance.hasAc,
};
