import 'package:json_annotation/json_annotation.dart';

part 'count_response.g.dart';

@JsonSerializable()
class NotificationCountResponse {
  @JsonKey(name: "unread_count")
  final int count;

  NotificationCountResponse(this.count);

  factory NotificationCountResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationCountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationCountResponseToJson(this);
}
