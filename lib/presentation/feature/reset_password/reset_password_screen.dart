import 'package:aqar_go/common/helpers/validation_helper.dart';
import 'package:aqar_go/presentation/feature/check_password_otp/check_password_otp_args.dart';
import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/helper/ui_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/widgets/app_button.dart';
import 'package:aqar_go/presentation/widgets/app_text_field.dart';
import 'package:aqar_go/presentation/widgets/password_fields_and_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routing/routes.dart';
import '../../widgets/screen_horizontal_padding.dart';
import 'cubit/reset_password_cubit.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ResetPasswordCubit>();
    return Scaffold(
      appBar: AppBar(title: Text("Reset Password".tr(context))),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: cubit.formKey,
            child: ScreenPadding(
              vertical: 16,
              child: Column(
                children: [
                  AppTextField(
                    labelText: "Email".tr(context),
                    textEditingController: cubit.emailController,
                    maxLines: 1,
                    validator: (value) => value.validateEmail()?.tr(context),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  _LocalizedSizedBox(),
                  PasswordFieldsAndValidator(
                    passwordNotifier: cubit.passwordNotifier,
                    passwordController: cubit.passwordController,
                    passwordConfirmationController:
                        cubit.passwordConfirmationController,
                  ),
                  _LocalizedSizedBox(),
                  BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                    listener: (context, state) {
                      state.when(
                        initial: () {},
                        loading: () {},
                        success: (String email, String password) {
                          context.pushRoute(
                            Routes.checkPasswordOTP,
                            extra: CheckPasswordOtpArgs(
                              email: email,
                              password: password,
                            ),
                          );
                        },
                        error: (error) {
                          context.showMyAlertDialogFromDomainError(error);
                        },
                        invalidInput: (dynamic Function() onProceed) {
                          context.showMySnackBar(
                            "Enter valid values".tr(context),
                            actionText: "Proceed".tr(context),
                            onActionClick: onProceed,
                          );
                        },
                      );
                    },
                    builder: (context, state) {
                      return AppButton(
                        isLoading: state.isLoading(),
                        onPressed: () {
                          cubit.sendPasswordResetEmail();
                        },
                        text: "Reset Password".tr(context),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LocalizedSizedBox extends StatelessWidget {
  const _LocalizedSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 16);
  }
}
