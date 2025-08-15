import 'package:flutter/material.dart';

class SelectFieldWithTitle<T> extends StatelessWidget {
  final String title;
  final Widget? spacer;
  final List<T> selectedValues;
  final List<T> values;
  final String Function(T enu) enumToName;
  final void Function(T newValue) onSelect;

  const SelectFieldWithTitle({
    super.key,
    required this.selectedValues,
    required this.values,
    required this.enumToName,
    required this.onSelect,
    required this.title,
    this.spacer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        spacer ?? SizedBox(height: 4),
        SelectField(
          selectedValues: selectedValues,
          values: values,
          enumToName: enumToName,
          onSelect: onSelect,
        ),
      ],
    );
  }
}

class SelectField<T> extends StatelessWidget {
  final List<T> selectedValues;
  final List<T> values;
  final String Function(T enu) enumToName;
  final void Function(T newValue) onSelect;

  const SelectField({
    super.key,
    required this.selectedValues,
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
              final isSelected = selectedValues.contains(e);
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
