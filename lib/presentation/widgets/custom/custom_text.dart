import 'package:flutter/material.dart';

import '../../../core/constants/constant_imports.dart';

class CustomText extends StatelessWidget {
  final String textString;
  final TextStyle? style;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;

  const CustomText(
    this.textString, {
    super.key,
    this.style,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow = TextOverflow.visible,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      overflow: overflow,
      textString,
      textAlign: textAlign,
      style: style ?? AppTextStyles.regularText(),
    );
  }
}
