part of 'my_ad_actions_cubit.dart';

@freezed
sealed class MyAdActionsState with _$MyAdActionsState {
  const factory MyAdActionsState.initial() = _Initial;

  const factory MyAdActionsState.loading(MyAdAction myAdAction) = _Loading;

  const factory MyAdActionsState.success(MyAdAction myAdAction) = _Success;

  const factory MyAdActionsState.error(
    DomainError error,
    MyAdAction myAdAction,
  ) = _Error;
}

extension X on MyAdActionsState {
  R when<R>({
    required R Function() initial,
    required R Function(MyAdAction myAdAction) loading,
    required R Function(DomainError error, MyAdAction myAdAction) error,
    required R Function(MyAdAction myAdAction) success,
  }) {
    switch (this) {
      case _Initial():
        return initial();
      case _Loading(myAdAction: var myAdAction):
        return loading(myAdAction);
      case _Error(error: var domainError, myAdAction: var myAdAction):
        return error(domainError, myAdAction);
      case _Success(myAdAction: var myAdAction):
        return success(myAdAction);
    }
  }

  bool isLoadingDeleting() => this is _Loading && (this as _Loading).myAdAction == MyAdAction.delete;
  bool isLoadingActivating() => this is _Loading && (this as _Loading).myAdAction == MyAdAction.activate;
  bool isLoadingDeactivating() => this is _Loading && (this as _Loading).myAdAction == MyAdAction.deactivate;
}
