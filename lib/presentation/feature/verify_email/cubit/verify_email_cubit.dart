import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/repo/auth_repo.dart';

part 'verify_email_state.dart';

part 'verify_email_cubit.freezed.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final AuthRepo _authRepo;

  VerifyEmailCubit(this._authRepo) : super(const VerifyEmailState.loading()) {
    sendVerificationEmail();
  }

  sendVerificationEmail() async {
    emit(const VerifyEmailState.loading());
    final response = await _authRepo.sendVerificationEmail();
    response.when(
      onSuccess: (successData) {
        emit(const VerifyEmailState.success());
      },
      onError: (error) {
        emit(VerifyEmailState.error(error));
      },
    );
  }
}
