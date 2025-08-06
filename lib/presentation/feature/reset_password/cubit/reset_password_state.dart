part of 'reset_password_cubit.dart';

@freezed
sealed class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState.initial() = _Initial;

  const factory ResetPasswordState.loading() = _Loading;

  const factory ResetPasswordState.invalidInput(Function() onProceed) =
      _InvalidInput;

  const factory ResetPasswordState.error(DomainError error) = _Error;

  const factory ResetPasswordState.success(
    String email,
    String password,
  ) = _Success;
}

extension ResetPasswordStateX on ResetPasswordState {
  R when<R>({
    required R Function() initial,
    required R Function() loading,
    required R Function(String email, String password)
    success,
    required R Function(DomainError error) error,
    required R Function(Function() onProceed) invalidInput,
  }) {
    switch (this) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Success(
        email: var email,
        password: var password,
      ):
        return success(email, password);
      case _Error(error: var domainError):
        return error(domainError);
      case _InvalidInput(onProceed: var onProceed):
        return invalidInput(onProceed);
    }
  }

  bool isLoading() => this is _Loading;
}
