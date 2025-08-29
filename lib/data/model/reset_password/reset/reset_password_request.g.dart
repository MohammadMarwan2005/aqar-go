// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordRequest _$ResetPasswordRequestFromJson(
  Map<String, dynamic> json,
) => ResetPasswordRequest(
  password: json['password'] as String,
  passwordConfirmation: json['password_confirmation'] as String,
  code: json['code'] as String,
  fcmToken: json['fcm_token'] as String?,
);

Map<String, dynamic> _$ResetPasswordRequestToJson(
  ResetPasswordRequest instance,
) => <String, dynamic>{
  'password': instance.password,
  'password_confirmation': instance.passwordConfirmation,
  'code': instance.code,
  'fcm_token': instance.fcmToken,
};
