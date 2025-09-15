import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/repo/auth_repo.dart';
import '../../../../domain/model/domain_error.dart';

part 'reset_password_state.dart';

part 'reset_password_cubit.freezed.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepo _authRepo;

  ResetPasswordCubit(this._authRepo)
    : super(const ResetPasswordState.initial()) {
    passwordController.addListener(() {
      passwordNotifier.value = passwordController.text;
    });
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final ValueNotifier<String> passwordNotifier = ValueNotifier("");

  void sendPasswordResetEmail({bool validate = true}) async {
    if (validate) {
      final isValid = formKey.currentState?.validate() == true;
      if (!isValid) {
        emit(
          ResetPasswordState.invalidInput(() {
            sendPasswordResetEmail(validate: false);
          }),
        );
        return;
      }
    }
    emit(const ResetPasswordState.loading());
    final email = emailController.text.trim();
    final response = await _authRepo.sendResetPasswordEmail(
      email,
    );
    final password = passwordController.text.trim();

    response.when(
      onSuccess: (successData) {
        emit(ResetPasswordState.success(email, password));
      },
      onError: (error) {
        emit(ResetPasswordState.error(error));
      },
    );
  }

  fillEmailAndPassword(String email, String password) {
    emailController.text = email;
    passwordController.text = password;
  }
}
