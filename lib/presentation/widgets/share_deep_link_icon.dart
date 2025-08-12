import 'package:aqar_go/presentation/helper/deep_link_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';

class ShareDeepLinkIcon extends StatelessWidget {
  const ShareDeepLinkIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: "Share".tr(context),
      onPressed: () {
        context.shareCurrentDeepLink();
      },
      icon: const Icon(Icons.share_rounded),
    );
  }
}
