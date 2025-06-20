import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../presentation/widgets/error_details.dart';

extension UiHelper on BuildContext {
  void showMySnackBar(
    String text, {
    String? actionText,
    Function()? onActionClick,
    EdgeInsetsGeometry? padding,
    bool removePreviousSnackBars = true,
    int durationInMillis = 2000,
  }) {
    if (removePreviousSnackBars) ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: (padding != null) ? padding : const EdgeInsets.all(8),
        duration: Duration(milliseconds: durationInMillis),
        content: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 3,
              child: Text(text, overflow: TextOverflow.ellipsis),
            ),
            if (actionText != null && onActionClick != null)
              Flexible(
                flex: 1,
                child: SnackBarAction(
                  label: actionText,
                  onPressed: onActionClick,
                ),
              ),
          ],
        ),
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }

  showMyAlertDialog(
    String title,
    List<String> details,
    bool isError, {
    Function()? onGotItClicked,
    String? smallTitle,
    String? gotItPlaceholder,
    Widget? firstAction,
  }) {
    showDialog(
      context: this,
      builder: (context) {
        return _MyAlertDialog(
          title: title,
          details: details,
          isError: isError,
          onGotItClicked: onGotItClicked,
          smallTitle: smallTitle,
          gotItPlaceholder: gotItPlaceholder,
          firstAction: firstAction,
        );
      },
    );
  }

  // why can't I overload this?
  showMyAlertDialogFromDomainError(
    DomainError error, {
    Function()? onGotItClicked,
    String? smallTitle,
    String? gotItPlaceholder,
    Widget? firstAction,
  }) {
    var details = error.details;
    var title = error.getMessage(this);
    if (details == null || details.isEmpty) {
      details = [title];
      title = "Something went wrong!".tr(this);
    }
    showMyAlertDialog(
      title,
      details,
      true,
      onGotItClicked: onGotItClicked,
      smallTitle: smallTitle,
      gotItPlaceholder: gotItPlaceholder,
      firstAction: firstAction,
    );
  }
}

class _MyAlertDialog extends StatelessWidget {
  final String title;
  final String? smallTitle;
  final List<String> details;
  final bool isError;
  final Function()? onGotItClicked;
  final String? gotItPlaceholder;
  final Widget? firstAction;

  const _MyAlertDialog({
    super.key,
    required this.title,
    required this.details,
    required this.isError,
    this.onGotItClicked,
    this.gotItPlaceholder,
    this.smallTitle,
    this.firstAction,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(
        isError ? Icons.error : MdiIcons.check,
        color: isError ? Colors.red : Colors.green,
        size: 32,
      ),
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (smallTitle != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(smallTitle!),
            ),
          ErrorDetails(details: details, isError: isError),
        ],
      ),
      actions: [
        if (firstAction != null) firstAction!,
        TextButton(
          onPressed: () {
            context.pop();
            if (onGotItClicked != null) onGotItClicked!();
          },
          child: Text(gotItPlaceholder ?? "Got it!".tr(context)),
        ),
      ],
    );
  }
}
