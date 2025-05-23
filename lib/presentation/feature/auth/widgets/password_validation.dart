import 'package:aqar_go/common/helpers/validation_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';

class PasswordValidation extends StatelessWidget {
  final String password;

  const PasswordValidation({super.key, required this.password});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ConditionText(
          name: "Must have at least one upper case letter".tr(context),
          validated: password.hasUpperCase(),
        ),
        SizedBox(height: 2),
        _ConditionText(
          name: "Must have at least one lower case letter".tr(context),
          validated: password.hasLowerCase(),
        ),
        SizedBox(height: 2),
        _ConditionText(
          name: "Must have at least one special Character".tr(context),
          validated: password.hasSpecialCharacter(),
        ),
        SizedBox(height: 2),
        _ConditionText(
          name: "Must have at least one number".tr(context),
          validated: password.hasNumber(),
        ),
        SizedBox(height: 2),
        _ConditionText(
          name: "Must be at least 8 characters".tr(context),
          validated: password.hasMinLength(),
        ),
        SizedBox(height: 2),
      ],
    );
  }
}

class _ConditionText extends StatelessWidget {
  final String name;
  final bool validated;

  const _ConditionText({
    super.key,
    required this.name,
    required this.validated,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: CircleAvatar(
            radius: 4,
            backgroundColor:
                validated ? Colors.green : Theme.of(context).colorScheme.error,
          ),
        ),
        Flexible(flex: 1, child: SizedBox(width: 5)),
        Flexible(flex: 25, child: Text(name, overflow: TextOverflow.ellipsis)),
      ],
    );
  }
}
