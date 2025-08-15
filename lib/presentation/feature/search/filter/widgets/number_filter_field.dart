import 'package:aqar_go/common/helpers/validation_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/app_text_field.dart';

class NumberFilterField extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const NumberFilterField({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      textEditingController: controller,
      labelText: label,
      validator:
          (value) =>
              value.validateAllDigits(allowEmptyOrNull: true)?.tr(context),
      keyboardType: TextInputType.number,
    );
  }
}
