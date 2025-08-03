import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/helper/ui_helper.dart';
import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/routing/guest_mode/post_login_instruction.dart';
import 'package:aqar_go/presentation/routing/routes.dart';
import 'package:flutter/material.dart';
import 'auth_state.dart';

authListener(
  BuildContext context,
  AuthState state,
  PostLoginInstruction? postLoginInstruction,
) {
  state.when(
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
      if (postLoginInstruction != null) {
        context.popThenPushRoute(
          postLoginInstruction.redirectionRoute,
          extra: postLoginInstruction.itsExtras,
        );
      } else {
        context.goRoute(Routes.home);
      }
    },
  );
}
