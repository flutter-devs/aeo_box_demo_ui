import 'package:flutter/material.dart';

import 'constant_imports.dart';

class AppTextStyles {
  static TextStyle header() {
    return AppTextStyles.boldText(fontSize: Dimensions.px30);
  }

  static TextStyle subHeader() {
    return AppTextStyles.mediumText(fontSize: Dimensions.px25);
  }

  static TextStyle regularText({
    double? height,
    Color color = ColorConstants.black,
    bool isUnderline = false,
    double fontSize = Dimensions.px15,
  }) {
    // return GoogleFonts.roboto(
    return TextStyle(
      fontFamily: 'Hellix',
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color,
      height: height,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle mediumText({
    double? height,
    Color color = ColorConstants.black,
    bool isUnderline = false,
    double fontSize = Dimensions.px15,
  }) {
    // return GoogleFonts.roboto(
    return TextStyle(
      fontFamily: 'Hellix',
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: color,
      height: height,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle semiBoldText({
    double? height,
    Color color = ColorConstants.black,
    bool isUnderline = false,
    double fontSize = Dimensions.px15,
  }) {
    // return GoogleFonts.roboto(
    return TextStyle(
      fontFamily: 'Hellix',
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: color,
      height: height,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle boldText({
    double? height,
    Color color = ColorConstants.black,
    bool isUnderline = false,
    double fontSize = Dimensions.px15,
  }) {
    // return GoogleFonts.roboto(
    return TextStyle(
      fontFamily: 'Hellix',
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
      height: height,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    );
  }
}
