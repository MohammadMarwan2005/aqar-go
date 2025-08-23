import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';

class BooleanFiledWithTitle extends StatelessWidget {
  final String title;
  final bool value;
  final void Function(bool newValue) onChanged;

  const BooleanFiledWithTitle({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 4),
        BooleanField(value: value, onChanged: onChanged, falseLabelId: null),
      ],
    );
  }
}

class BooleanField extends StatelessWidget {
  final bool? value;
  final void Function(bool newValue) onChanged;
  final String? trueLabelId;
  final String? falseLabelId;

  const BooleanField({
    super.key,
    required this.value,
    required this.onChanged,
    this.trueLabelId,
    this.falseLabelId = "Doesn't Matter",
  });

  @override
  Widget build(BuildContext context) {
    final isYesSelected = value == true;
    final isNoSelected = value == false;
    // else: null, no chips is selected
    final yesContentColor =
        (isYesSelected)
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.onSurface;

    final noContentColor =
        (isNoSelected)
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.onSurface;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ChoiceChip(
              label: Text(trueLabelId?.tr(context) ?? "Yes".tr(context)),
              selected: isYesSelected,
              onSelected: (_) {
                onChanged(true);
              },
              selectedColor: Theme.of(context).colorScheme.primary,
              labelStyle: TextStyle(color: yesContentColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ChoiceChip(
              label: Text(falseLabelId?.tr(context) ?? "No".tr(context)),
              selected: isNoSelected,
              onSelected: (_) {
                onChanged(false);
              },
              selectedColor: Theme.of(context).colorScheme.primary,
              labelStyle: TextStyle(color: noContentColor),
            ),
          ),
        ],
      ),
    );
  }
}
