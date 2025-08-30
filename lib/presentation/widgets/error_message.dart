import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final DomainError error;
  final Function() onTryAgain;
  final Widget Function(List<String> details)? detailsWidget;

  const ErrorMessage({
    super.key,
    required this.error,
    required this.onTryAgain,
    this.detailsWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(error.getMessage(context)),
            _LocalizedSizedBox(),
            if (error.getTranslatedDetailsOrValidationErrors(context) != null &&
                detailsWidget != null) ...[
              detailsWidget!(
                error.getTranslatedDetailsOrValidationErrors(context)!,
              ),
            ],
            _LocalizedSizedBox(),
            ElevatedButton(
              onPressed: onTryAgain,
              child: Center(
                child: Text(
                  "Try Again".tr(context),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LocalizedSizedBox extends StatelessWidget {
  const _LocalizedSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 8);
  }
}
