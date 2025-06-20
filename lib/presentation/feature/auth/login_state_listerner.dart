import 'package:aqar_go/common/helpers/navigation_helper.dart';
import 'package:aqar_go/common/helpers/ui_helper.dart';
import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/routing/routes.dart';
import 'package:flutter/material.dart';
import 'auth_state.dart';

authListener(BuildContext context, AuthState state) {
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
      // var details = domainError.details;
      // var title = domainError.getMessage(context);
      // if(details == null || details.isEmpty) {
      //   details = [title];
      //   title = "Something went wrong!".tr(context);
      // }
      // context.showMyAlertDialog(title, details, true);
      context.showMyAlertDialogFromDomainError(domainError);
    },
    success: (_) {
      context.goRoute(Routes.test);
    },
  );
}
