import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int trimLength;
  final TextStyle? style;

  const ExpandableText({
    super.key,
    required this.text,
    this.trimLength = 100, // number of characters before "see more"
    this.style,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final textStyle = widget.style ?? DefaultTextStyle.of(context).style;
    final displayText = expanded || widget.text.length <= widget.trimLength
        ? widget.text
        : "${widget.text.substring(0, widget.trimLength)}... ";

    return InkWell(
      onTap: () => setState(() => expanded = !expanded),
      child: RichText(
        text: TextSpan(
          text: displayText,
          style: textStyle,
          children: [
            if (widget.text.length > widget.trimLength)
              TextSpan(
                text: expanded ? " See less".tr(context) : " See more".tr(context),
                style: textStyle.copyWith(color: Colors.blue),
              ),
          ],
        ),
      ),
    );
  }
}
