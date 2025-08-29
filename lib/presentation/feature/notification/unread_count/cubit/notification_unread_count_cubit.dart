import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:aqar_go/domain/repo/local_data_repo.dart';
import 'package:aqar_go/domain/repo/notification_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_unread_count_cubit.freezed.dart';

part 'notification_unread_count_state.dart';

class NotificationUnreadCountCubit extends Cubit<NotificationUnreadCountState> {
  final NotificationRepo _notificationRepo;
  final LocalDataRepo _localDataRepo;

  NotificationUnreadCountCubit(this._notificationRepo, this._localDataRepo)
    : super(const NotificationUnreadCountState.success(0)) {
    fetchCount();
  }

  fetchCount() async {
    if (_localDataRepo.isGuest()) return;

    emit(const NotificationUnreadCountState.loading());
    final result = await _notificationRepo.getUnreadNotificationsCount();
    result.when(
      onSuccess: (successData) {
        emit(NotificationUnreadCountState.success(successData));
      },
      onError: (error) {
        emit(NotificationUnreadCountState.error(error));
      },
    );
  }

  resetToZero() {
    emit(NotificationUnreadCountState.success(0));
  }
}
