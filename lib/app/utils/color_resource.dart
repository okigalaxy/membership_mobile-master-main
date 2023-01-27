import 'package:flutter/material.dart';

class ColorResources {
  static const Color primaryColor = Color(0xFFAB2639);
  static const Color goldenColor = Color(0xFFB69769);
  static const Color blackColor = Color(0xFF252E4E);
  static const Color greyColor = Color(0xFF858585);
  static const Color backgroundColor = Color(0xFFF5F6FA);

  static const Map<int, Color> colorMap = {
    50: primaryColor,
    100: primaryColor,
    200: primaryColor,
    300: primaryColor,
    400: primaryColor,
    500: primaryColor,
    600: primaryColor,
    700: primaryColor,
    800: primaryColor,
    900: primaryColor,
  };

  static const int colorPrimaryMaterial = 0xFFAB2639;
  static const MaterialColor primaryMaterial =
      MaterialColor(colorPrimaryMaterial, colorMap);
}
