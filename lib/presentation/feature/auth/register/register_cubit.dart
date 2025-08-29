import 'package:aqar_go/data/model/auth/register_request.dart';
import 'package:aqar_go/domain/repo/auth_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/repo/local_data_repo.dart';
import '../auth_state.dart';

class RegisterCubit extends Cubit<AuthState> {
  final LocalDataRepo _localDataRepo;
  final AuthRepo _authRepo;
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final ValueNotifier<String> passwordNotifier = ValueNotifier("");
  final passwordConfirmationController = TextEditingController();

  RegisterCubit(this._authRepo, this._localDataRepo)
    : super(const AuthState.initial()) {
    passwordController.addListener(() {
      passwordNotifier.value = passwordController.text;
    });
  }

  Future<void> register({bool validate = true}) async {
    final email = emailController.text;
    final password = passwordController.text;
    final firstName = firstNameController.text;
    final lastName = lastNameController.text;
    final phoneNumber = phoneNumberController.text;
    final passwordConfirmation = passwordConfirmationController.text;

    final isValid = formKey.currentState?.validate() == true;

    if (validate && !isValid) {
      emit(
        AuthState.invalidInput(() {
          register(validate: false);
        }),
      );
      return;
    }
    emit(AuthState.loading());

    final res = await _authRepo.register(
      RegisterRequest(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        passwordConfirmation: passwordConfirmation,
        fcmToken: "Some token",
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
