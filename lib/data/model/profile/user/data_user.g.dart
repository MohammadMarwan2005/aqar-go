// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataUser _$DataUserFromJson(Map<String, dynamic> json) => DataUser(
  id: (json['id'] as num).toInt(),
  emailVerifiedAt: json['email_verified_at'] as String?,
  profile: DataUserProfile.fromJson(json['profile'] as Map<String, dynamic>),
  isPremium: (json['has_active_subscription'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$DataUserToJson(DataUser instance) => <String, dynamic>{
  'id': instance.id,
  'email_verified_at': instance.emailVerifiedAt,
  'has_active_subscription': instance.isPremium,
  'profile': instance.profile,
};
