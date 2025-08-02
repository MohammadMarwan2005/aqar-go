// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'office_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfficeData _$OfficeDataFromJson(Map<String, dynamic> json) => OfficeData(
  floor: (json['floor'] as num).toInt(),
  rooms: (json['rooms'] as num).toInt(),
  bathrooms: (json['bathrooms'] as num).toInt(),
  meetingRooms: (json['meeting_rooms'] as num).toInt(),
  hasParking: json['has_parking'] as bool,
  furnished: json['furnished'] as bool,
);

Map<String, dynamic> _$OfficeDataToJson(OfficeData instance) =>
    <String, dynamic>{
      'floor': instance.floor,
      'rooms': instance.rooms,
      'bathrooms': instance.bathrooms,
      'meeting_rooms': instance.meetingRooms,
      'has_parking': instance.hasParking,
      'furnished': instance.furnished,
    };
