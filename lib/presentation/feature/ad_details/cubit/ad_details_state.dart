part of 'ad_details_cubit.dart';

@freezed
sealed class AdDetailsState with _$AdDetailsState {
  const factory AdDetailsState.loading() = _Loading;

  const factory AdDetailsState.success(Ad ad) = _Success;

  const factory AdDetailsState.error(DomainError error) = _Error;
}

extension AdDetailsStateX on AdDetailsState {
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

  R? whenOrNull<R>({
    R Function()? loading,
    R Function(DomainError domainError)? error,
    R Function(Ad ads)? success,
  }) {
    switch (this) {
      case _Loading():
        return loading?.call();
      case _Error(error: var domainError):
        return error?.call(domainError);
      case _Success(ad: var ad):
        return success?.call(ad);
    }
  }
}
