import 'package:json_annotation/json_annotation.dart';

part 'auth_response_data.g.dart';

@JsonSerializable()
class AuthResponseData {
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  final String email;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  final String token;
  @JsonKey(name: 'token_type')
  final String tokenType;
  @JsonKey(name: "email_verified_at")
  final String? emailVerifiedAt;

  AuthResponseData({
    this.firstName,
    this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.token,
    required this.tokenType,
    required this.emailVerifiedAt,
  });

  factory AuthResponseData.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseDataToJson(this);

  bool isVerified() => emailVerifiedAt != null;
}
