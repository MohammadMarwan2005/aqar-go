// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataUserProfile _$DataUserProfileFromJson(Map<String, dynamic> json) =>
    DataUserProfile(
      id: (json['id'] as num).toInt(),
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phoneNumber: json['phone_number'] as String,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$DataUserProfileToJson(DataUserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
      'image_url': instance.imageUrl,
    };
