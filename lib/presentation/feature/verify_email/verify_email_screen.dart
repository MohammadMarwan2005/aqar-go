import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/app_button.dart';
import '../../widgets/error_message.dart';
import '../../widgets/loading_screen.dart';
import '../../widgets/screen_horizontal_padding.dart';
import 'cubit/verify_email_cubit.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Email Verification".tr(context)),
      ),
      body: SafeArea(
        child: ScreenPadding(
          child: BlocBuilder<VerifyEmailCubit, VerifyEmailState>(
            builder: (context, state) {
              return state.when(
                loading: () => const LoadingScreen(),
                error: (domainError) => ErrorMessage(
                  error: domainError,
                  onTryAgain: () {
                    context.read<VerifyEmailCubit>().sendVerificationEmail();
                  },
                ),
                success: () => const _VerifyEmailContent(),
              );
            },
          ),
        ),
      ),
    );
  }
}
class _VerifyEmailContent extends StatelessWidget {
  const _VerifyEmailContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 48),
          Text("A verification link has been sent to your email address.".tr(context), style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 32),
          AppButton(
            text: "Continue".tr(context),
            onPressed: () {
              context.popRoute();
            },
          ),
          SizedBox(height: 16),
          AppButton(
            isSecondary: true,
            text: "Resend Email".tr(context),
            onPressed: () {
              context.read<VerifyEmailCubit>().sendVerificationEmail();
            },
          ),
        ],
      ),
    );
  }
}

