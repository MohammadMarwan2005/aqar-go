import 'package:flutter/material.dart';

class GreenRedChip extends StatelessWidget {
  final bool good;
  final String goodText;
  final String badText;
  const GreenRedChip({super.key, required this.good, required this.goodText, required this.badText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color:
        !good
            ? Colors.red.shade100
            : Colors.green.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        (good) ? goodText : badText,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color:
          !good
              ? Colors.red.shade800
              : Colors.green.shade800,
        ),
      ),
    );
  }
}
