import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_error.g.dart';

@JsonSerializable()
class APIError {
  final String message;
  // todo: add more fields like details and code

  APIError({required this.message});

  factory APIError.fromJson(Map<String, dynamic> json) =>
      _$APIErrorFromJson(json);

  Map<String, dynamic> toJson() => _$APIErrorToJson(this);
}

extension X on APIError {
  DomainError toDomainError() {
    return DomainError(message: message);
  }
}
