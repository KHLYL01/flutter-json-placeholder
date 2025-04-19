import 'dart:ui';

import 'package:flutter/material.dart';

class Font {
  static apply({
    required double fontSize,
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
  }) {
    return TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }
}

class AppTextStyle {
  static bold20({Color? color}) {
    return Font.apply(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static bold18() {
    return Font.apply(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
  }

  static semiBold18() {
    return Font.apply(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }

  static regular18() {
    return Font.apply(
      fontSize: 18,
    );
  }

  static regular16() {
    return Font.apply(
      fontSize: 16,
    );
  }
}
