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

  AuthResponseData({
    this.firstName,
    this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.token,
    required this.tokenType,
  });

  factory AuthResponseData.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseDataToJson(this);
}
