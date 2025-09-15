import 'package:aqar_go/data/model/auth/login_request.dart';
import 'package:aqar_go/domain/repo/auth_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/repo/local_data_repo.dart';
import '../../../fcm/push_notification_service.dart';
import '../auth_state.dart';

class LoginCubit extends Cubit<AuthState> {
  final LocalDataRepo _localDataRepo;
  final AuthRepo _authRepo;
  final PushNotificationService _pushNotificationService;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ValueNotifier<String> passwordNotifier = ValueNotifier("");

  LoginCubit(this._authRepo, this._localDataRepo, this._pushNotificationService)
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
        fcmToken: await _pushNotificationService.getDeviceToken()
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
