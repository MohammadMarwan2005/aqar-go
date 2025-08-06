part of 'check_password_otp_cubit.dart';

@freezed
sealed class CheckPasswordOtpState with _$CheckPasswordOtpState {
  const factory CheckPasswordOtpState.initial() = _Initial;
  const factory CheckPasswordOtpState.loading() = _Loading;
  const factory CheckPasswordOtpState.success(AuthResponseData responseData) = _Success;
  const factory CheckPasswordOtpState.error(DomainError error) = _Error;
  const factory CheckPasswordOtpState.invalidInput(Function() onProceed) = _InvalidInput;
}

extension CheckPasswordOtpStateExtension on CheckPasswordOtpState {

  R when<R>({
    required R Function() initial,
    required R Function() loading,
    required R Function(AuthResponseData responseData) success,
    required R Function(DomainError error) error,
    required R Function(Function() onProceed) invalidInput,
  }) {
    switch (this) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Success(responseData: var responseData):
        return success(responseData);
      case _Error(error: var domainError):
        return error(domainError);
      case _InvalidInput(onProceed: var onProceed):
        return invalidInput(onProceed);
    }
  }

  bool isLoading() => this is _Loading;
}