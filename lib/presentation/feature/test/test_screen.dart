import 'package:aqar_go/common/helpers/navigation_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/lang/switch_lang_label.dart';
import 'package:flutter/material.dart';

import '../../routing/routes.dart';
import '../../widgets/app_button.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("AqarGo".tr(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Hello, AqarGo!".tr(context)),
              SizedBox(height: 32),
              AppButton(
                onPressed: () {
                  context.pushRoute(Routes.onboarding);
                },
                text: "Let's Go!".tr(context),
                isLoading: false,
                isSecondary: true,
              ),
              SizedBox(height: 32),
              SwitchLangLabel(),

              Column(
                children: [
                  for (var isLoading in [false, true])
                    for (var isSecondary in [false, true])
                      for (var isEnabled in [true, false])
                        AppButton(
                          onPressed:
                              isEnabled
                                  ? () {
                                    print(
                                      'Pressed: isLoading=$isLoading, isSecondary=$isSecondary',
                                    );
                                  }
                                  : null,
                          text: 'loading=$isLoading, isSecondary=$isSecondary',
                          isLoading: isLoading,
                          isSecondary: isSecondary,
                          // textColor: isSecondary ? Colors.blue : Colors.white,
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
