import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:human_resources/widgets/export.dart';

TextSpan customTextSpan(
    {String text,
    String fontFamily,
    double fontSize,
    height,
    FontWeight fontWeight,
    Color color,
    BuildContext context,
    void Function() onTap,
    List<TextSpan> children}) {
  return TextSpan(
      text: text,
      style: TextStyle(
          height: 1.7,
          fontSize: screenAwareSize(fontSize, context, width: true),
          fontWeight: fontWeight,
          color: color,
          fontFamily: fontFamily ?? 'Crossten'),
      recognizer: TapGestureRecognizer()..onTap = () => onTap(),
      children: children);
}
