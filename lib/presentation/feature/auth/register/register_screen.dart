import 'package:aqar_go/presentation/feature/auth/register/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:aqar_go/common/helpers/navigation_helper.dart';
import 'package:aqar_go/common/helpers/validation_helper.dart';
import 'package:aqar_go/presentation/feature/auth/login/login_cubit.dart';
import 'package:aqar_go/presentation/feature/auth/login_state_listerner.dart';
import 'package:aqar_go/presentation/feature/auth/widgets/auth_suggestion.dart';
import 'package:aqar_go/presentation/feature/auth/widgets/auth_template.dart';
import 'package:aqar_go/presentation/feature/auth/widgets/password_validation.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/routing/routes.dart';
import 'package:aqar_go/presentation/widgets/app_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/app_button.dart';
import '../auth_state.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();
    return AuthTemplate(
      title: "Create Account".tr(context),
      desc:
      "Join us today and start exploring everything our app has to offer. We’re excited to welcome you to our community!"
          .tr(context),
      formAndButton: Form(
        key: registerCubit.formKey,
        child: Column(
          children: [
            AppTextField(
              textEditingController: registerCubit.firstNameController,
              labelText: "First Name".tr(context),
              maxLines: 1,
              validator: (value) => value.validateNotEmpty()?.tr(context),
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: 16),
            AppTextField(
              textEditingController: registerCubit.lastNameController,
              labelText: "Last Name".tr(context),
              maxLines: 1,
              validator: (value) => value.validateNotEmpty()?.tr(context),
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: 16),
            AppTextField(
              textEditingController: registerCubit.phoneNumberController,
              labelText: "Phone Number".tr(context),
              maxLines: 1,
              validator: (value) => value.validatePhoneNumber()?.tr(context),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            AppTextField(
              textEditingController: registerCubit.emailController,
              labelText: "Email".tr(context),
              maxLines: 1,
              validator: (value) => value.validateEmail()?.tr(context),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            AppTextField(
              textEditingController: registerCubit.passwordController,
              labelText: "Password".tr(context),
              isPassword: true,
              validator: (value) => value.validatePassword()?.tr(context),
              maxLines: 1,
            ),
            SizedBox(height: 16),
            ValueListenableBuilder(
              valueListenable: registerCubit.passwordNotifier,
              builder:
                  (context, value, child) =>
                  PasswordValidation(password: value),
            ),
            SizedBox(height: 16),
            AppTextField(
              textEditingController: registerCubit.passwordConfirmationController,
              labelText: "Password Confirmation".tr(context),
              isPassword: true,
              validator: (value) => value.validatePasswordConfirmations(registerCubit.passwordNotifier.value)?.tr(context),
              maxLines: 1,
            ),
            SizedBox(height: 32),
            BlocConsumer<RegisterCubit, AuthState>(
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
                    context.read<RegisterCubit>().register();
                  },
                  text: "Sign Up".tr(context),
                  isLoading: isLoading,
                );
              },
              listener: authListener,
            ),
          ],
        ),
      ),
      suggestion: AuthSuggestion(
        suggestionText: "Already have an account?".tr(context),
        buttonLabel: "Login".tr(context),
        onClick: () {
          context.goRoute(Routes.login);
        },
      ),
    );
  }
}
