class Notification {
  final int id;
  final String title;
  final String body;
  final int adId;
  final NotificationState state;

  Notification({
    required this.title,
    required this.body,
    required this.id,
    required this.adId,
    required this.state,
  });

  bool get isRead => state == NotificationState.read;
}

enum NotificationState {
  read,
  unread;

  static NotificationState fromBoolean(bool isRead) =>
      isRead ? NotificationState.read : NotificationState.unread;
}
