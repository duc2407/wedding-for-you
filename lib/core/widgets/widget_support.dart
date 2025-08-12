import 'package:fe_wd24/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class AppWidget {
  static TextStyle whitetextstyle(double size) {
    return TextStyle(
      color: Colors.white,
      fontSize: size,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle normaltextstyle(double size) {
    return TextStyle(
      color: textNormal,
      fontSize: size,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle headlinertextstyle(double size) {
    return TextStyle(
      color: textBold,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle pinktextstyle(double size) {
    return TextStyle(
      color: TWColors.pink.shade500,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle pinktexnormaltstyle(double size) {
    return TextStyle(
      color: TWColors.pink.shade500,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }
}

Widget heightSpace(double height) {
  return SizedBox(height: height);
}

Widget widthSpace(double width) {
  return SizedBox(width: width);
}
