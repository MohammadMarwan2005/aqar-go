import 'package:aqar_go/data/model/auth/auth_response_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/model/domain_error.dart';
part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.invalidInput(Function() onProceed) = _InvalidInput;
  const factory AuthState.error(DomainError error) = _Error;
  const factory AuthState.success(AuthResponseData responseData) = _Success;
}

extension X on AuthState {
  R when<R>({
    required R Function() initial,
    required R Function() loading,
    required R Function(Function() onProceed) invalidInput,
    required R Function(DomainError domainError) error,
    required R Function(AuthResponseData responseData) success,
  }) {
    switch (this) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _InvalidInput(onProceed: var onProceed):
        return invalidInput(onProceed);
      case _Error(error: var domainError):
        return error(domainError);
      case _Success(responseData: var responseData):
        return success(responseData);
    }
  }
}