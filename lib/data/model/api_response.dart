import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class APIResponse<T> {
  final int status;
  final T data;
  final String message;

  APIResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  factory APIResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$APIResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(
      Object Function(T value) toJsonT,
      ) =>
      _$APIResponseToJson(this, toJsonT);
}
