import 'package:flutter/material.dart';

class ScreenPadding extends StatelessWidget {
  final double horizontal;
  final double vertical;
  final Widget child;
  const ScreenPadding({super.key, required this.child, this.horizontal = 16, this.vertical = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: child,
    );
  }
}
