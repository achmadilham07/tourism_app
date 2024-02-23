import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  const TextWidget.heading(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
