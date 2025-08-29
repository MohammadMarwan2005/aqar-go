part of 'notification_unread_count_cubit.dart';

@freezed
sealed class NotificationUnreadCountState with _$NotificationUnreadCountState {
  const factory NotificationUnreadCountState.loading() = _Loading;

  const factory NotificationUnreadCountState.success(int count) = _Success;

  const factory NotificationUnreadCountState.error(DomainError error) = _Error;
}

extension NotificationUnreadCountStateExtension
    on NotificationUnreadCountState {
  R when<R>({
    required R Function() loading,
    required R Function(int count) success,
    required R Function(DomainError error) error,
  }) {
    return switch (this) {
      _Loading() => loading(),
      _Success(count: final count) => success(count),
      _Error(error: final e) => error(e),
    };
  }

  bool get isSuccess => this is _Success;

  bool get isLabelVisible => _getCurrentCount() == null && _getCurrentCount() != 0;

  String getCountLabel() {
    return _getCurrentCount()?.toString() ?? "";
  }

  int? _getCurrentCount() {
    return when(
      success: (count) => count,
      loading: () => null,
      error: (error) => null,
    );
  }
}
