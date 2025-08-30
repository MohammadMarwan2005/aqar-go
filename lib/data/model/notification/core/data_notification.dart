import 'package:aqar_go/domain/model/notification/notification.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_notification.g.dart';

@JsonSerializable()
class DataNotification {
  final int id;
  @JsonKey(name: "user_id")
  final int userId;
  @JsonKey(name: "ad_id")
  final int adId;
  final String title;
  final String body;
  @JsonKey(name: "is_read")
  final bool isRead;
  final String type;

  DataNotification({
    required this.id,
    required this.userId,
    required this.adId,
    required this.title,
    required this.body,
    required this.isRead,
    required this.type,
  });

  factory DataNotification.fromJson(Map<String, dynamic> json) =>
      _$DataNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$DataNotificationToJson(this);

  Notification toDomain() {
    return Notification(
      id: id,
      adId: adId,
      title: title,
      body: body,
      state: NotificationState.fromBoolean(isRead),
    );
  }
}
