// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['password_confirmation'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      fcmToken: json['fcmToken'] as String?,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'fcmToken': instance.fcmToken,
    };
