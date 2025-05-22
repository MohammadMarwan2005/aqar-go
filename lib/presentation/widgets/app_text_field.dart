import 'package:flutter/material.dart';

import '../theme/app_static_colors.dart';

class AppTextField extends StatefulWidget {
  final String labelText;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextEditingController? textEditingController;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onChanged;
  final bool Function()? validate;
  final int? minLines;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final GlobalKey<FormFieldState>? fieldKey;

  const AppTextField({
    super.key,
    required this.labelText,
    this.isPassword = false,
    this.keyboardType,
    this.textEditingController,
    this.validator,
    this.onChanged,
    this.validate,
    this.minLines,
    this.maxLines,
    this.textInputAction,
    this.fieldKey,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isTextVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final obscureText = widget.isPassword && !isTextVisible;
    final colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      textInputAction: widget.textInputAction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: (obscureText) ? 1 : widget.maxLines,
      minLines: widget.minLines,
      cursorOpacityAnimates: true,
      onChanged: widget.onChanged,
      validator: widget.validator,
      controller: widget.textEditingController,
      keyboardType: widget.keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        isDense: true,
        fillColor: colorScheme.surface,
        filled: true,
        suffixIcon: widget.isPassword ? buildSuffixIcon(isTextVisible) : null,
        enabledBorder: _getBorder(AppStaticColors.lightGrey),
        errorBorder: _getBorder(Theme.of(context).colorScheme.error),
        focusedBorder: _getBorder(Theme.of(context).colorScheme.primary),
        border: _getBorder(Theme.of(context).colorScheme.primary),
        labelText: widget.labelText,
        contentPadding:
            widget.isPassword ? EdgeInsets.all(18) : EdgeInsets.all(18),
      ),
    );
  }

  OutlineInputBorder _getBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 2),
      borderRadius: BorderRadius.circular(4),
    );
  }

  void _invertVisibility() {
    setState(() {
      isTextVisible = !isTextVisible;
    });
  }

  Widget buildSuffixIcon(bool isVisible) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: IconButton(
      onPressed: _invertVisibility,
      icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
    ),
  );

  @override
  void dispose() {
    super.dispose();
  }
}
