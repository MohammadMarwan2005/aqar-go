import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorDetails extends StatelessWidget {
  final List<String> details;
  final bool isError;

  const ErrorDetails({super.key, required this.details, required this.isError});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children:
      details.map((detail) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CircleAvatar(
                backgroundColor: isError ? Colors.red : Colors.green,
                radius: 5,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(child: Text(detail)),
          ],
        );
      }).toList(),
    );
  }
}
