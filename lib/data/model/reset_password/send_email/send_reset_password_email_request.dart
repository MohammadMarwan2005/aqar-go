import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_reset_password_email_request.g.dart';

@JsonSerializable()
class SendResetPasswordEmailRequest {

  @JsonKey(name: 'email')
  final String email;

  SendResetPasswordEmailRequest(this.email);

  factory SendResetPasswordEmailRequest.fromJson(Map<String, dynamic> json) => _$SendResetPasswordEmailRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendResetPasswordEmailRequestToJson(this);
}