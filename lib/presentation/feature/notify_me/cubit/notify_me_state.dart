part of 'notify_me_cubit.dart';

@freezed
sealed class NotifyMeState with _$NotifyMeState {
  const factory NotifyMeState.initial(bool isGuest) = _Initial;
  const factory NotifyMeState.loading(bool isGuest) = _Loading;
  const factory NotifyMeState.success(bool isGuest) = _Success;
  const factory NotifyMeState.error(bool isGuest, DomainError error) = _Error;
}

extension NotifyMeStateX on NotifyMeState {
  R when<R>({
    required R Function() initial,
    required R Function() loading,
    required R Function() success,
    required R Function(DomainError error) error,
  }) {
    switch (this) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Success():
        return success();
      case _Error(error: var domainError):
        return error(domainError);
    }
  }

  bool isLoading() => this is _Loading;

  bool isSuccess() => this is _Success;
}
