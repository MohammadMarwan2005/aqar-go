// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'near_to_you_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NearToYouRequest _$NearToYouRequestFromJson(Map<String, dynamic> json) =>
    NearToYouRequest(
      pageSize: (json['number'] as num).toInt(),
      long: (json['longitude'] as num).toDouble(),
      lat: (json['latitude'] as num).toDouble(),
    );

Map<String, dynamic> _$NearToYouRequestToJson(NearToYouRequest instance) =>
    <String, dynamic>{
      'number': instance.pageSize,
      'longitude': instance.long,
      'latitude': instance.lat,
    };
