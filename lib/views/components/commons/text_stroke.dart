// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextStroke extends StatelessWidget {
  const TextStroke({
    super.key,
    required this.colorStroke,
    required this.colorText,
    required this.fontSize,
    required this.textBody,
    required this.strokeWidth,
    required this.maxLines,
  });
  final colorStroke;
  final colorText;
  final fontSize;
  final textBody;
  final strokeWidth;
  final maxLines;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AutoSizeText(
          textBody,
          style: TextStyle(
            fontSize: fontSize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = colorStroke,
          ),
          maxLines: 1,
        ),
        AutoSizeText(
          textBody,
          style: TextStyle(
            fontSize: fontSize,
            color: colorText!,
          ),
          maxLines: maxLines,
        )
      ],
    );
  }
}
