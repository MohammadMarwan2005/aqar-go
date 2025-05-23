import 'package:aqar_go/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';

class AuthSuggestion extends StatelessWidget {
  final String suggestionText;
  final String buttonLabel;
  final Function() onClick;

  const AuthSuggestion({
    super.key,
    required this.suggestionText,
    required this.buttonLabel,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(suggestionText),
        TextButton(onPressed: onClick, child: Text(buttonLabel)),
      ],
    );
  }
}
