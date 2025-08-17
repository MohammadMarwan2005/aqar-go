import 'package:aqar_go/presentation/helper/ui_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helper/url_helper.dart';

class UrlWidget extends StatelessWidget {
  final String url;
  final Widget child;

  const UrlWidget({super.key, required this.url, required this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4.0),
      onLongPress: () {
        var message = "";
        Clipboard.setData(ClipboardData(text: url));
        message = "Copied to clipboard!".tr(context);
        context.showMySnackBar(message);
      },
      onTap: () {
        openUrl(url, () {
          context.showMySnackBar("Failed to open this link!".tr(context));
        });
      },
      child: child,
    );
    ;
  }
}
