// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataUser _$DataUserFromJson(Map<String, dynamic> json) => DataUser(
  id: (json['id'] as num).toInt(),
  emailVerifiedAt: json['email_verified_at'] as String?,
  profile: DataUserProfile.fromJson(json['profile'] as Map<String, dynamic>),
  isPremium: json['is_premium'] as bool? ?? false,
);

Map<String, dynamic> _$DataUserToJson(DataUser instance) => <String, dynamic>{
  'id': instance.id,
  'email_verified_at': instance.emailVerifiedAt,
  'is_premium': instance.isPremium,
  'profile': instance.profile,
};
