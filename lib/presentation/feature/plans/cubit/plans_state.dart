part of 'plans_cubit.dart';

@freezed
sealed class PlansState with _$PlansState {
  const factory PlansState.initial(PlanEnum planEnum) = _Initial;

  const factory PlansState.loading(PlanEnum planEnum) = _Loading;

  const factory PlansState.error(PlanEnum planEnum, DomainError error) = _Error;

  const factory PlansState.success(PlanEnum planEnum) = _Success;
}

extension PlansStateX on PlansState {
  PlanEnum get planEnum => when(
    initial: (PlanEnum planEnum) => planEnum,
    loading: (PlanEnum planEnum) => planEnum,
    error: (PlanEnum planEnum, DomainError error) => planEnum,
    success: (PlanEnum planEnum) => planEnum,
  );

  bool get isPremium => this.planEnum == PlanEnum.premium;

  R when<R>({
    required R Function(PlanEnum planEnum) initial,
    required R Function(PlanEnum planEnum) loading,
    required R Function(PlanEnum planEnum, DomainError error) error,
    required R Function(PlanEnum planEnum) success,
  }) {
    switch (this) {
      case _Initial(planEnum: var planEnum):
        return initial(planEnum);
      case _Loading(planEnum: var planEnum):
        return loading(planEnum);
      case _Error(planEnum: var planEnum, error: var domainError):
        return error(planEnum, domainError);
      case _Success(planEnum: var planEnum):
        return success(planEnum);
    }
  }

  bool get isSuccess => this is _Success;
}
