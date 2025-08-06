part of 'plans_cubit.dart';

@freezed
sealed class PlansState with _$PlansState {
  const factory PlansState.initial(bool isPremium) = _Initial;

  const factory PlansState.loading(bool isPremium) = _Loading;

  const factory PlansState.error(bool isPremium, DomainError error) = _Error;

  const factory PlansState.success(bool isPremium) = _Success;
}

extension PlansStateX on PlansState {
  bool get isPremium => when(
    initial: (bool isPremium) => isPremium,
    loading: (bool isPremium) => isPremium,
    error: (bool isPremium, DomainError error) => isPremium,
    success: (bool isPremium) => isPremium,
  );

  R when<R>({
    required R Function(bool isPremium) initial,
    required R Function(bool isPremium) loading,
    required R Function(bool isPremium, DomainError error) error,
    required R Function(bool isPremium) success,
  }) {
    switch (this) {
      case _Initial(isPremium: var isPremium):
        return initial(isPremium);
      case _Loading(isPremium: var isPremium):
        return loading(isPremium);
      case _Error(isPremium: var isPremium, error: var domainError):
        return error(isPremium, domainError);
      case _Success(isPremium: var isPremium):
        return success(isPremium);
    }
  }
}
