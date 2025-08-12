import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/di/get_it.dart';
import '../routing/routing_use_case.dart';

class UpButton extends StatelessWidget {
  const UpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        if (GoRouter.of(context).canPop()) {
          GoRouter.of(context).pop();
        } else {
          final routingUseCase = getIt<RoutingUseCase>();
          final route = await routingUseCase.getFirstRoute();
          if (context.mounted) context.go(route);
        }
      },
      icon: Icon(Icons.arrow_back_ios),
    );
  }
}
