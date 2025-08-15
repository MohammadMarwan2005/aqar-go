import 'package:flutter/material.dart';

class MultiSelectField<T> extends StatelessWidget {
  final List<T> selectedValue;
  final List<T> values;
  final String Function(T enu) enumToName;
  final void Function(T newValue) onSelect;

  const MultiSelectField({
    super.key,
    required this.selectedValue,
    required this.values,
    required this.enumToName,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
        values.map((e) {
          final isSelected = e == selectedValue;
          final contentColor =
          isSelected
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.onSurface;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ChoiceChip(
              label: Text(enumToName(e)),
              selected: isSelected,
              onSelected: (_) => onSelect(e),
              selectedColor: Theme.of(context).colorScheme.primary,
              labelStyle: TextStyle(color: contentColor),
            ),
          );
        }).toList(),
      ),
    );
  }
}
