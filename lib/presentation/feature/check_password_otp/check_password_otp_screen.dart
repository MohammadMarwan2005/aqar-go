import 'package:aqar_go/common/helpers/logging_helper.dart';
import 'package:aqar_go/common/helpers/validation_helper.dart';
import 'package:aqar_go/presentation/feature/auth/widgets/auth_suggestion.dart';
import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/helper/ui_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/widgets/app_button.dart';
import 'package:aqar_go/presentation/widgets/screen_horizontal_padding.dart';
import 'package:aqar_go/presentation/widgets/title_and_desc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../routing/routes.dart';
import '../reset_password/cubit/reset_password_cubit.dart';
import 'cubit/check_password_otp_cubit.dart';

class CheckPasswordOtpScreen extends StatelessWidget {
  const CheckPasswordOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final checkPasswordOtpCubit = context.read<CheckPasswordOtpCubit>();
    final resetPasswordCubit = context.read<ResetPasswordCubit>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ScreenPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                TitleAndDesc(
                  title: "Check Password OTP".tr(context),
                  desc: "We've sent a verification code to the email {email}"
                      .tr(
                        context,
                        params: {
                          "email":
                              checkPasswordOtpCubit.checkPasswordOtpArgs.email,
                        },
                      ),
                ),
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Form(
                      key: checkPasswordOtpCubit.formKey,
                      child: PinCodeTextField(
                        controller: checkPasswordOtpCubit.otpController,
                        appContext: context,
                        length: 6,
                        onChanged: (value) {},
                        onCompleted: (value) {
                          debugLog("Completed: $value");
                        },
                        validator:
                            (value) => value.validateAllDigits()?.tr(context),
                        keyboardType: TextInputType.number,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          inactiveColor:
                              Theme.of(context).colorScheme.secondary,
                          selectedColor: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                  builder: (context, state) {
                    Widget? widget =
                        (state.isLoading())
                            ? Center(
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                            : null;
                    return widget ??
                        AuthSuggestion(
                          suggestionText: "Didn't get the code?".tr(context),
                          buttonLabel: "Resend".tr(context),
                          onClick: () {
                            resetPasswordCubit.fillEmailAndPassword(
                              checkPasswordOtpCubit.checkPasswordOtpArgs.email,
                              checkPasswordOtpCubit
                                  .checkPasswordOtpArgs
                                  .password,
                            );
                            context
                                .read<ResetPasswordCubit>()
                                .sendPasswordResetEmail(validate: false);
                          },
                        );
                  },
                  listener: (BuildContext context, ResetPasswordState state) {
                    state.when(
                      initial: () {},
                      loading: () {},
                      success: (String email, String password) {
                        context.showMySnackBar(
                          "Another OTP code has been sent!".tr(context),
                        );
                      },
                      error: (error) {
                        context.showMyAlertDialogFromDomainError(error);
                      },
                      invalidInput: (dynamic Function() onProceed) {},
                    );
                  },
                ),
                SizedBox(height: 128),
                BlocConsumer<CheckPasswordOtpCubit, CheckPasswordOtpState>(
                  listener: (context, state) {
                    return state.when(
                      initial: () {},
                      loading: () {},
                      invalidInput: (onProceed) {
                        context.showMySnackBar(
                          "Enter valid values".tr(context),
                          actionText: "Proceed".tr(context),
                          onActionClick: onProceed,
                        );
                      },
                      error: (domainError) {
                        context.showMyAlertDialogFromDomainError(domainError);
                      },
                      success: (_) {
                        context.goRoute(Routes.home);
                      },
                    );
                  },
                  builder: (context, state) {
                    return AppButton(
                      text: "Continue".tr(context),
                      isLoading: state.isLoading(),
                      onPressed: () {
                        checkPasswordOtpCubit.checkPasswordOtp();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
