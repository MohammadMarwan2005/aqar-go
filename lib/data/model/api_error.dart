import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_error.g.dart';

@JsonSerializable()
class APIError {
  final String message;
  final int status;
  final Map<String, List<dynamic>>? data;

  APIError(this.message, this.status, this.data);

  factory APIError.fromJson(Map<String, dynamic> json) =>
      _$APIErrorFromJson(json);

  Map<String, dynamic> toJson() => _$APIErrorToJson(this);
}

extension X on APIError {
  DomainError toDomainError() {
    final List<String> details =
        (data?.values ?? {}).expand((element) => element.map((e) => e.toString())).toList();
    return DomainError(message: message, details: details);
  }
}
