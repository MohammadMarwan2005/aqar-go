import 'package:aqar_go/domain/model/resource.dart';
import 'package:aqar_go/domain/repo/notification_repo.dart';
import 'package:aqar_go/presentation/feature/paging_base/cubit/paging_cubit.dart';

import '../../../../domain/model/notification/notification.dart';

class NotificationCubit extends PagingCubit<Notification> {
  final NotificationRepo _notificationRepo;

  NotificationCubit(this._notificationRepo)
    : super(const PagingState.loading([], 1, false));

  @override
  int pageSize = 10;

  @override
  Future<Resource<List<Notification>>> getItems(int page) {
    return _notificationRepo.getNotifications(page: page, pageSize: pageSize);
  }
}
