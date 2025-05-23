import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final bool isLoading;
  final Color? textColor;
  final bool isSecondary;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.textColor,
    this.isSecondary = false,
  });

  @override
  Widget build(BuildContext context) {
    final finalOnPressed = isLoading ? null : onPressed;
    final colorScheme = Theme.of(context).colorScheme;

    final primaryColor = colorScheme.primary;
    final onPrimaryColor = colorScheme.onPrimary;
    final onSurfaceColor = colorScheme.onSurface;

    final foregroundColor =
        isSecondary
            ? primaryColor
            : finalOnPressed != null
            ? onPrimaryColor
            : onSurfaceColor.withValues(alpha: 0.38);

    final borderSideColor = isSecondary ? primaryColor : Colors.transparent;

    final buttonStyle = ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: borderSideColor),
        ),
      ),
    );

    final child = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Row(
        mainAxisAlignment:
            isLoading
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
        children: [
          if (isLoading) const SizedBox(width: 20),
          Text(
            text,
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: foregroundColor),
          ),
          if (isLoading)
            SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: foregroundColor,
                strokeWidth: 3,
              ),
            ),
        ],
      ),
    );

    return isSecondary
        ? OutlinedButton(
          onPressed: finalOnPressed,
          style: buttonStyle,
          child: child,
        )
        : FilledButton(
          onPressed: finalOnPressed,
          style: buttonStyle,
          child: child,
        );
  }
}
