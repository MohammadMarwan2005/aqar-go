import 'package:aqar_go/data/model/auth/forgot_password_button.dart';
import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/common/helpers/validation_helper.dart';
import 'package:aqar_go/presentation/feature/auth/login/login_cubit.dart';
import 'package:aqar_go/presentation/feature/auth/login_state_listerner.dart';
import 'package:aqar_go/presentation/feature/auth/widgets/auth_suggestion.dart';
import 'package:aqar_go/presentation/feature/auth/widgets/auth_template.dart';
import 'package:aqar_go/presentation/feature/auth/widgets/password_validation.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/routing/routes.dart';
import 'package:aqar_go/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../routing/guest_mode/post_login_instruction.dart';
import '../../../widgets/app_button.dart';
import '../auth_state.dart';

class LoginScreen extends StatelessWidget {
  final PostLoginInstruction? postLoginInstruction;

  const LoginScreen({super.key, this.postLoginInstruction});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return AuthTemplate(
      title: "Welcome Back".tr(context),
      desc: "We’re thrilled to have you return and hope you've been doing well."
          .tr(context),
      formAndButton: Form(
        key: loginCubit.formKey,
        child: Column(
          children: [
            AppTextField(
              textEditingController: loginCubit.emailController,
              labelText: "Email".tr(context),
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
              validator: (value) => value.validateEmail()?.tr(context),
            ),
            SizedBox(height: 16),
            AppTextField(
              textEditingController: loginCubit.passwordController,
              labelText: "Password".tr(context),
              isPassword: true,
              validator: (value) => value.validatePassword()?.tr(context),
              maxLines: 1,
            ),
            SizedBox(height: 8),
            ForgotPasswordButton(),
            SizedBox(height: 8),
            ValueListenableBuilder(
              valueListenable: loginCubit.passwordNotifier,
              builder:
                  (context, value, child) =>
                      PasswordValidation(password: value),
            ),
            SizedBox(height: 32),
            BlocConsumer<LoginCubit, AuthState>(
              builder: (context, state) {
                final isLoading = state.when(
                  loading: () => true,
                  initial: () => false,
                  invalidInput: (_) => false,
                  error: (domainError) => false,
                  success: (_) => false,
                );
                return AppButton(
                  onPressed: () {
                    context.read<LoginCubit>().login();
                  },
                  text: "Login".tr(context),
                  isLoading: isLoading,
                );
              },
              listener:
                  (context, state) =>
                      authListener(context, state, postLoginInstruction),
            ),
          ],
        ),
      ),
      suggestion: AuthSuggestion(
        suggestionText: "Don't have an account?".tr(context),
        buttonLabel: "Sign Up".tr(context),
        onClick: () {
          context.popThenPushRoute(
            Routes.register,
            extra: postLoginInstruction,
          );
        },
      ),
    );
  }
}
