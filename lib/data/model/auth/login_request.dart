import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  final String email;
  final String password;
  @JsonKey(name: "password_confirmation")
  final String passwordConfirmation;
  @JsonKey(name: 'fcm_token')
  final String? fcmToken;

  LoginRequest({
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    this.fcmToken,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
