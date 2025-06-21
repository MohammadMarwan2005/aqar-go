import 'package:aqar_go/common/di/get_it.dart';
import 'package:aqar_go/common/helpers/navigation_helper.dart';
import 'package:aqar_go/data/repo/local_data_repo.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/lang/switch_lang_label.dart';
import 'package:aqar_go/presentation/widgets/app_text_field.dart';
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("This is a test screen, I know it's not a great UI, but it will be changed later...".tr(context)),
                SizedBox(height: 32),
                AppButton(
                  onPressed: () {
                    context.pushRoute(Routes.createUpdatePost);
                  },
                  text: "Create Post".tr(context),
                ),
                SizedBox(height: 32),
                AppButton(
                  onPressed: () {
                    context.pushRoute(Routes.profile);
                  },
                  text: "Profile".tr(context),
                ),
                SizedBox(height: 32),
                AppButton(
                  isSecondary: true,
                  onPressed: () {
                    final LocalDataRepo repo = getIt();
                    repo.deleteToken();
                    context.pushRoute(Routes.login);
                  },
                  text: "Logout".tr(context),
                ),
                SizedBox(height: 32),
                SwitchLangLabel(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonTests extends StatelessWidget {
  const _ButtonTests({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              ),
      ],
    );
  }
}

class _TextFieldTests extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  _TextFieldTests({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          for (var isPassword in [true, false])
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppTextField(
                labelText: "Test",
                isPassword: isPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) return  "value.isEmpty";
                },
                textInputAction: TextInputAction.next,
              ),
            ),
          AppButton(onPressed: () {
            _formKey.currentState?.validate();
          }, text: "Validate")
        ],
      ),
    );
  }
}

