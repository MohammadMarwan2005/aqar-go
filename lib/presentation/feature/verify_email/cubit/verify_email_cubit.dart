import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:aqar_go/presentation/feature/verify_email/verify_instruction.dart';
import 'package:aqar_go/presentation/routing/guest_mode/post_login_instruction.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/repo/auth_repo.dart';

part 'verify_email_state.dart';

part 'verify_email_cubit.freezed.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final AuthRepo _authRepo;
  final VerifyInstruction verifyInstruction;

  VerifyEmailCubit(this._authRepo, {required this.verifyInstruction}) : super(const VerifyEmailState.success()) {
    if (!verifyInstruction.afterLogin) sendVerificationEmail();
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
