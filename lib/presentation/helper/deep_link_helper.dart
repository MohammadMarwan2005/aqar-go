import 'package:aqar_go/presentation/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import '../../common/di/get_it.dart';

extension DeepLinkHelper on BuildContext {
  String _getDeepLink() {
    return Routes.webRoute + (GoRouter.of(this).state.matchedLocation);
  }

  void shareCurrentDeepLink() {
    final SharePlus share = getIt();
    share.share(ShareParams(text: _getDeepLink()));
  }
}
