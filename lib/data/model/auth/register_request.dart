import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String email;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String? passwordConfirmation;

  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  final String? fcmToken;

  RegisterRequest({
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.passwordConfirmation,
    this.firstName,
    this.lastName,
    this.fcmToken,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
