part of 'my_ads_cubit.dart';

@freezed
sealed class MyAdsState with _$MyAdsState {
  const factory MyAdsState.loading() = _Loading;
  const factory MyAdsState.error(DomainError error) = _Error;
  const factory MyAdsState.success(List<Ad> ads) = _Success;
}

extension X on MyAdsState {
  R when<R>({
    required R Function() loading,
    required R Function(DomainError domainError) error,
    required R Function(List<Ad> ads) success,
  }) {
    switch (this) {
      case _Loading():
        return loading();
      case _Error(error: var domainError):
        return error(domainError);
      case _Success(ads: var ads):
        return success(ads);
    }
  }
}
