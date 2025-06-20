import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final DomainError error;
  final Function() onTryAgain;

  const ErrorMessage({
    super.key,
    required this.error,
    required this.onTryAgain,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(error.getMessage(context)),
            ElevatedButton(
              onPressed: onTryAgain,
              child: Text("Try Again".tr(context)),
            ),
          ],
        ),
      ),
    );
  }
}
