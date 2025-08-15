
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';

class NumberFieldWithTitle extends StatelessWidget {
  final String title;
  final int? value;
  final void Function(int? newValue) onChanged;
  final bool isNullable; // Add this to control whether to show "None" chip

  const NumberFieldWithTitle({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.isNullable = false, // Default is false
  });

  @override
  Widget build(BuildContext context) {
    // List of values for the chips (from 0 to 5)
    final numberChips = List.generate(6, (index) => index);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 4),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // Conditionally show "None" chip for nullable fields
              if (isNullable)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text("None".tr(context)),
                    selected: value == null,
                    onSelected: (_) {
                      onChanged(null);
                    },
                    selectedColor: Theme.of(context).colorScheme.primary,
                    labelStyle: TextStyle(
                      color:
                      value == null
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              // Chips for numbers 0 to 5
              ...numberChips.map((num) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(num.toString()),
                    selected: value == num,
                    onSelected: (_) {
                      onChanged(num);
                    },
                    selectedColor: Theme.of(context).colorScheme.primary,
                    labelStyle: TextStyle(
                      color:
                      value == num
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
