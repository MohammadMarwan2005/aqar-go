import 'package:aqar_go/presentation/feature/check_password_otp/check_password_otp_args.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/model/auth/auth_response_data.dart';
import '../../../../domain/model/domain_error.dart';
import '../../../../domain/repo/auth_repo.dart';
import '../../../../domain/repo/local_data_repo.dart';
import '../../../fcm/push_notification_service.dart';

part 'check_password_otp_cubit.freezed.dart';

part 'check_password_otp_state.dart';

class CheckPasswordOtpCubit extends Cubit<CheckPasswordOtpState> {
  final LocalDataRepo _localDataRepo;
  final AuthRepo _authRepo;
  final PushNotificationService _pushNotificationService;

  final CheckPasswordOtpArgs checkPasswordOtpArgs;

  CheckPasswordOtpCubit(
    this._localDataRepo,
    this._authRepo,
    this._pushNotificationService, {
    required this.checkPasswordOtpArgs,
  }) : super(const CheckPasswordOtpState.initial());

  final TextEditingController otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> checkPasswordOtp({bool validate = true}) async {
    final otp = otpController.text.trim();

    if (validate) {
      final isValid = formKey.currentState?.validate() == true;
      if (!isValid) {
        emit(
          CheckPasswordOtpState.invalidInput(() {
            checkPasswordOtp(validate: false);
          }),
        );
        return;
      }
    }
    emit(const CheckPasswordOtpState.loading());
    final response = await _authRepo.resetPassword(
      checkPasswordOtpArgs.password,
      otp,
      fcmToken: await _pushNotificationService.getDeviceToken(),
    );
    response.when(
      onSuccess: (successData) async {
        await _localDataRepo.setToken(successData.token);
        emit(CheckPasswordOtpState.success(successData));
      },
      onError: (error) {
        emit(CheckPasswordOtpState.error(error));
      },
    );
  }
}
