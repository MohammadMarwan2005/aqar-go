import 'package:aqar_go/data/model/auth/login_request.dart';
import 'package:aqar_go/data/repo/auth_repo.dart';
import 'package:aqar_go/data/repo/local_data_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_state.dart';

class LoginCubit extends Cubit<AuthState> {
  final LocalDataRepo _localDataRepo;
  final AuthRepo _authRepo;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: "test@test.test");
  final passwordController = TextEditingController(text: "password");
  final ValueNotifier<String> passwordNotifier = ValueNotifier("");

  LoginCubit(this._authRepo, this._localDataRepo)
    : super(const AuthState.initial()) {
    passwordController.addListener(() {
      passwordNotifier.value = passwordController.text;
    });
  }

  login({bool validate = true}) async {
    final isValid = formKey.currentState?.validate() == true;

    if (validate && !isValid) {
      emit(
        AuthState.invalidInput(() {
          login(validate: false);
        }),
      );
      return;
    }
    emit(AuthState.loading());
    final res = await _authRepo.login(
      LoginRequest(
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: passwordController.text,
      ),
    );
    res.when(
      onSuccess: (successData) async {
        await _localDataRepo.setToken(successData.token);
        emit(AuthState.success(successData));
      },
      onError: (error) {
        emit(AuthState.error(error));
      },
    );
  }

  @override
  Future<void> close() {
    passwordController.dispose();
    passwordNotifier.dispose();
    return super.close();
  }
}
