// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apartment_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApartmentData _$ApartmentDataFromJson(Map<String, dynamic> json) =>
    ApartmentData(
      floor: (json['floor'] as num).toInt(),
      rooms: (json['rooms'] as num).toInt(),
      bathrooms: (json['bathrooms'] as num).toInt(),
      bedrooms: (json['bedrooms'] as num).toInt(),
      hasElevator: json['has_elevator'] as bool,
      hasAlternativePower: json['has_alternative_power'] as bool,
      hasGarage: json['has_garage'] as bool,
      furnished: json['furnished'] as bool,
      furnishedType: json['furnished_type'] as String,
    );

Map<String, dynamic> _$ApartmentDataToJson(ApartmentData instance) =>
    <String, dynamic>{
      'floor': instance.floor,
      'rooms': instance.rooms,
      'bathrooms': instance.bathrooms,
      'bedrooms': instance.bedrooms,
      'has_elevator': instance.hasElevator,
      'has_alternative_power': instance.hasAlternativePower,
      'has_garage': instance.hasGarage,
      'furnished': instance.furnished,
      'furnished_type': instance.furnishedType,
    };
