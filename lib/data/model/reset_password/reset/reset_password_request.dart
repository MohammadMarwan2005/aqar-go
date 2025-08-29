import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request.g.dart';

@JsonSerializable()
class ResetPasswordRequest {
  @JsonKey(name: "password")
  final String password;
  @JsonKey(name: "password_confirmation")
  final String passwordConfirmation;
  @JsonKey(name: "code")
  final String code;
  @JsonKey(name: 'fcm_token')
  final String? fcmToken;

  ResetPasswordRequest({
    required this.password,
    required this.passwordConfirmation,
    required this.code,
    this.fcmToken,
  });

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);
}
