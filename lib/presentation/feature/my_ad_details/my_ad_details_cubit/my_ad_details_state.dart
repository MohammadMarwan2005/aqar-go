part of 'my_ad_details_cubit.dart';

@freezed
sealed class MyAdDetailsState with _$MyAdDetailsState {
  const factory MyAdDetailsState.loading() = _Loading;
  const factory MyAdDetailsState.error(DomainError error) = _Error;
  const factory MyAdDetailsState.success(Ad ad) = _Success;
}

extension MyAdDetailsStateX on MyAdDetailsState {
  R when<R>({
    required R Function() loading,
    required R Function(DomainError domainError) error,
    required R Function(Ad ads) success,
  }) {
    switch (this) {
      case _Loading():
        return loading();
      case _Error(error: var domainError):
        return error(domainError);
      case _Success(ad: var ad):
        return success(ad);
    }
  }
}
