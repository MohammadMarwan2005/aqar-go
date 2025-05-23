import 'package:aqar_go/presentation/lang/switch_lang_label.dart';
import 'package:flutter/material.dart';

class AuthTemplate extends StatelessWidget {
  final String title;
  final String desc;
  final Widget formAndButton;
  final Widget suggestion;

  const AuthTemplate({
    super.key,
    required this.title,
    required this.desc,
    required this.formAndButton,
    required this.suggestion,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 50),
                    Text(
                      title,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      desc,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 32),
                    formAndButton,
                    SizedBox(height: 32),
                    SwitchLangLabel(),
                    SizedBox(height: 32),
                    suggestion,
                    SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
