import 'package:aqar_go/data/api/api_service.dart';
import 'package:aqar_go/data/api/safe_api_caller.dart';
import 'package:aqar_go/data/model/api_response.dart';
import 'package:aqar_go/data/model/notification/core/data_notification.dart';
import 'package:aqar_go/data/model/paged_response.dart';
import 'package:aqar_go/data/model/paging/page_request.dart';
import 'package:aqar_go/domain/model/notification/notification.dart';

import 'package:aqar_go/domain/model/resource.dart';

import '../../domain/repo/notification_repo.dart';
import '../model/ad/ad_data.dart';
import '../model/notification/count_response/count_response.dart';

class NotificationRepoImpl implements NotificationRepo {
  final SafeAPICaller _safeAPICaller;
  final APIService _apiService;

  NotificationRepoImpl(this._safeAPICaller, this._apiService);

  @override
  Future<Resource<List<Notification>>> getNotifications({
    required int page,
    required int pageSize,
  }) {
    return _safeAPICaller
        .call<List<Notification>, APIResponse<PagedResponse<DataNotification>>>(
          apiCall: () {
            return _apiService.getNotifications(page: page, pageSize: pageSize);
          },
          dataToDomain:
              (data) =>
                  data.data.data
                      .map((notification) => notification.toDomain())
                      .toList(),
        );
  }

  @override
  Future<Resource<int>> getUnreadNotificationsCount() {
    return _safeAPICaller.call<int, APIResponse<NotificationCountResponse>>(
      apiCall: () {
        return _apiService.getUnreadNotificationsCount();
      },
      dataToDomain: (data) => data.data.count,
    );
  }
}
