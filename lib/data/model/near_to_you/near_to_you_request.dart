import 'package:json_annotation/json_annotation.dart';

part 'near_to_you_request.g.dart';

@JsonSerializable()
class NearToYouRequest {
  @JsonKey(name: "number")
  final int pageSize;
  @JsonKey(name: "longitude")
  final double long;
  @JsonKey(name: "latitude")
  final double lat;

  NearToYouRequest({
    required this.pageSize,
    required this.long,
    required this.lat,
  });

  factory NearToYouRequest.fromJson(Map<String, dynamic> json) =>
      _$NearToYouRequestFromJson(json);

  Map<String, dynamic> toJson() => _$NearToYouRequestToJson(this);
}
