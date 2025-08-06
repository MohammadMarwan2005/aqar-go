import 'package:aqar_go/common/helpers/validation_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';

import '../feature/auth/widgets/password_validation.dart';
import 'app_text_field.dart';

class PasswordFieldsAndValidator extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmationController;
  final ValueNotifier<String> passwordNotifier;
  final double height;

  const PasswordFieldsAndValidator({
    super.key,
    required this.passwordNotifier,
    required this.passwordController,
    required this.passwordConfirmationController,
    this.height = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          textEditingController: passwordController,
          labelText: "Password".tr(context),
          isPassword: true,
          validator: (value) => value.validatePassword()?.tr(context),
          maxLines: 1,
        ),
        SizedBox(height: height),
        ValueListenableBuilder(
          valueListenable: passwordNotifier,
          builder:
              (context, value, child) => PasswordValidation(password: value),
        ),
        SizedBox(height: height),
        AppTextField(
          textEditingController: passwordConfirmationController,
          labelText: "Password Confirmation".tr(context),
          isPassword: true,
          validator:
              (value) => value
                  .validatePasswordConfirmations(passwordNotifier.value)
                  ?.tr(context),
          maxLines: 1,
        ),
      ],
    );
  }
}
