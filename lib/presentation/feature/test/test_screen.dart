import 'package:aqar_go/common/helpers/navigation_helper.dart';
import 'package:flutter/material.dart';

import '../../routing/routes.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("AqarGo"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Hello, AqarGo!"),
            SizedBox(height: 32),
            FilledButton(onPressed: () {
              context.pushRoute(Routes.onboarding);
            }, child: Text("Let's Go!"))
          ],
        ),
      ),
    );
  }
}
