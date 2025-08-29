import '../model/notification/notification.dart';
import '../model/resource.dart';

abstract class NotificationRepo {
  Future<Resource<List<Notification>>> getNotifications({
    required int page,
    required int pageSize,
  });

  Future<Resource<int>> getUnreadNotificationsCount();
}
