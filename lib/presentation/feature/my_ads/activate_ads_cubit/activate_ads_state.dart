part of 'activate_ads_cubit.dart';

@freezed
sealed class ActivateAdsState with _$ActivateAdsState {
  const factory ActivateAdsState.initial() = _Initial;

  const factory ActivateAdsState.loading() = _Loading;

  const factory ActivateAdsState.error(DomainError error) = _Error;

  const factory ActivateAdsState.success() = _Success;
}

extension ActivateAdsStateX on ActivateAdsState {
  R when<R>({
    required R Function() initial,
    required R Function() loading,
    required R Function(DomainError error) error,
    required R Function() success,
  }) {
    switch (this) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Error(error: var domainError):
        return error(domainError);
      case _Success():
        return success();
    }
  }

  bool isLoading() {
    return this is _Loading;
  }
}
