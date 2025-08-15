// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_search_filter_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataSearchFilterSettings _$DataSearchFilterSettingsFromJson(
  Map<String, dynamic> json,
) => DataSearchFilterSettings(
  pageSize: (json['num'] as num).toInt(),
  minPrice: (json['min_price'] as num?)?.toInt(),
  maxPrice: (json['max_price'] as num?)?.toInt(),
  minArea: (json['min_area'] as num?)?.toInt(),
  maxArea: (json['max_area'] as num?)?.toInt(),
  type: json['type'] as String?,
  data: json['data'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$DataSearchFilterSettingsToJson(
  DataSearchFilterSettings instance,
) => <String, dynamic>{
  'num': instance.pageSize,
  if (instance.minPrice case final value?) 'min_price': value,
  if (instance.maxPrice case final value?) 'max_price': value,
  if (instance.minArea case final value?) 'min_area': value,
  if (instance.maxArea case final value?) 'max_area': value,
  if (instance.type case final value?) 'type': value,
  if (instance.data case final value?) 'data': value,
};

ApartmentData _$ApartmentDataFromJson(Map<String, dynamic> json) =>
    ApartmentData(
      minFloor: (json['min_floor'] as num?)?.toInt(),
      maxFloor: (json['max_floor'] as num?)?.toInt(),
      minRooms: (json['min_rooms'] as num?)?.toInt(),
      maxRooms: (json['max_rooms'] as num?)?.toInt(),
      minBathrooms: (json['min_bathrooms'] as num?)?.toInt(),
      minBedrooms: (json['min_bedrooms'] as num?)?.toInt(),
      maxBedrooms: (json['max_bedrooms'] as num?)?.toInt(),
      hasAlternativePower: json['has_alternative_power'] as bool?,
      hasGarage: json['has_garage'] as bool?,
      hasElevator: json['has_elevator'] as bool?,
      furnished: json['furnished'] as bool?,
      furnishedType:
          (json['furnished_type'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$ApartmentDataToJson(ApartmentData instance) =>
    <String, dynamic>{
      if (instance.minFloor case final value?) 'min_floor': value,
      if (instance.maxFloor case final value?) 'max_floor': value,
      if (instance.minRooms case final value?) 'min_rooms': value,
      if (instance.maxRooms case final value?) 'max_rooms': value,
      if (instance.minBathrooms case final value?) 'min_bathrooms': value,
      if (instance.minBedrooms case final value?) 'min_bedrooms': value,
      if (instance.maxBedrooms case final value?) 'max_bedrooms': value,
      if (instance.hasAlternativePower case final value?)
        'has_alternative_power': value,
      if (instance.hasGarage case final value?) 'has_garage': value,
      if (instance.hasElevator case final value?) 'has_elevator': value,
      if (instance.furnished case final value?) 'furnished': value,
      if (instance.furnishedType case final value?) 'furnished_type': value,
    };

LandData _$LandDataFromJson(Map<String, dynamic> json) => LandData(
  landType:
      (json['LandType'] as List<dynamic>?)?.map((e) => e as String).toList(),
  isInsideMasterPlan: json['is_inside_master_plan'] as bool?,
  isServiced: json['is_serviced'] as bool?,
  slope: (json['slope'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$LandDataToJson(LandData instance) => <String, dynamic>{
  if (instance.landType case final value?) 'LandType': value,
  if (instance.isInsideMasterPlan case final value?)
    'is_inside_master_plan': value,
  if (instance.isServiced case final value?) 'is_serviced': value,
  if (instance.slope case final value?) 'slope': value,
};

OfficeData _$OfficeDataFromJson(Map<String, dynamic> json) => OfficeData(
  floor: (json['floor'] as num?)?.toInt(),
  rooms: (json['rooms'] as num?)?.toInt(),
  minBathrooms: (json['minBathrooms'] as num?)?.toInt(),
  minMeetingRooms: (json['meeting_rooms'] as num?)?.toInt(),
  hasParking: json['has_parking'] as bool?,
  furnished: json['furnished'] as bool?,
);

Map<String, dynamic> _$OfficeDataToJson(OfficeData instance) =>
    <String, dynamic>{
      if (instance.floor case final value?) 'floor': value,
      if (instance.rooms case final value?) 'rooms': value,
      if (instance.minBathrooms case final value?) 'minBathrooms': value,
      if (instance.minMeetingRooms case final value?) 'meeting_rooms': value,
      if (instance.hasParking case final value?) 'has_parking': value,
      if (instance.furnished case final value?) 'furnished': value,
    };

ShopData _$ShopDataFromJson(Map<String, dynamic> json) => ShopData(
  shopType:
      (json['ShopType'] as List<dynamic>?)?.map((e) => e as String).toList(),
  hasWarehouse: json['has_warehouse'] as bool?,
  hasBathroom: json['has_bathroom'] as bool?,
  hasAc: json['has_ac'] as bool?,
);

Map<String, dynamic> _$ShopDataToJson(ShopData instance) => <String, dynamic>{
  if (instance.shopType case final value?) 'ShopType': value,
  if (instance.hasWarehouse case final value?) 'has_warehouse': value,
  if (instance.hasBathroom case final value?) 'has_bathroom': value,
  if (instance.hasAc case final value?) 'has_ac': value,
};
