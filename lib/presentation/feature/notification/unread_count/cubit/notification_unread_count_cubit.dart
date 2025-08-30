import 'dart:async';
import 'package:aqar_go/common/helpers/logging_helper.dart';
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
  Timer? _timer; // Timer for periodic fetching every 2 minutes

  NotificationUnreadCountCubit(this._notificationRepo, this._localDataRepo)
    : super(const NotificationUnreadCountState.success(0)) {
    fetchCount();
    _timer = Timer.periodic(const Duration(minutes: 2), (_) => fetchCount());
  }

  Future<void> fetchCount() async {
    if (_localDataRepo.isGuest()) return;

    // emit(const NotificationUnreadCountState.loading());

    final result = await _notificationRepo.getUnreadNotificationsCount();
    result.when(
      onSuccess: (successData) {
        debugLog('Notification count: $successData');
        emit(NotificationUnreadCountState.success(successData));
      },
      onError: (error) {
        emit(NotificationUnreadCountState.error(error));
      },
    );
  }

  void resetToZero() {
    emit(const NotificationUnreadCountState.success(0));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
