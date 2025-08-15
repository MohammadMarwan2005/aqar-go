import 'package:aqar_go/presentation/feature/search/filter/widgets/number_filter_field.dart';
import 'package:flutter/material.dart';

class MinMaxFilterField extends StatelessWidget {
  final TextEditingController minController;
  final TextEditingController maxController;
  final String minLabel;
  final String maxLabel;

  const MinMaxFilterField({
    super.key,
    required this.minController,
    required this.maxController,
    required this.minLabel,
    required this.maxLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: NumberFilterField(controller: minController, label: minLabel),
        ),
        SizedBox(width: 8),
        Flexible(
          child: NumberFilterField(controller: maxController, label: maxLabel),
        ),
      ],
    );
  }
}

class _BadWidget extends StatelessWidget {
  final int constMin;
  final int constMax;
  final int currentMin;
  final int currentMax;
  final String minLabel;
  final String maxLabel;
  final void Function(RangeValues range) onChanged;

  const _BadWidget({
    super.key,
    required this.constMin,
    required this.constMax,
    required this.currentMin,
    required this.currentMax,
    required this.onChanged,
    required this.minLabel,
    required this.maxLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(minLabel),
        Expanded(
          child: RangeSlider(
            values: RangeValues(constMin.toDouble(), constMax.toDouble()),
            min: constMin.toDouble(),
            max: constMax.toDouble(),
            divisions: 100,
            labels: RangeLabels(currentMin.toString(), currentMax.toString()),
            onChanged: onChanged,
          ),
        ),
        Text(maxLabel),
      ],
    );
  }
}
