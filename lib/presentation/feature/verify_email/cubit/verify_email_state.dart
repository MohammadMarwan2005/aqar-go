part of 'verify_email_cubit.dart';

@freezed
sealed class VerifyEmailState with _$VerifyEmailState {
  const factory VerifyEmailState.loading() = _Loading;

  const factory VerifyEmailState.error(DomainError domainError) = _Error;

  const factory VerifyEmailState.success() = _Success;
}

extension VerifyEmailStateX on VerifyEmailState {
  R when<R>({
    required R Function() loading,
    required R Function(DomainError domainError) error,
    required R Function() success,
  }) {
    switch (this) {
      case _Loading():
        return loading();
      case _Error(domainError: var domainError):
        return error(domainError);
      case _Success():
        return success();
    }
  }
}
