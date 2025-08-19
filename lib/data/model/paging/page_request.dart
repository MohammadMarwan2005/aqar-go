import 'package:json_annotation/json_annotation.dart';

part 'page_request.g.dart';

@JsonSerializable()
class PageRequest {
  @JsonKey(name: "num")
  int pageSize;

  PageRequest({required this.pageSize});

  factory PageRequest.fromJson(Map<String, dynamic> json) => _$PageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PageRequestToJson(this);
}
