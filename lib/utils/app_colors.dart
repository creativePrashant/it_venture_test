import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color whiteColorBackground = Color(0xFFFFFFFF);
  static const Color appBlackColor = Color(0xFF000000);
  static const Color appBlackColor1 = Color(0xFF707070);
  static const Color appNavigationBackground = Color(0xFF2F2F2F);
  static const Color appRedColor = Color(0xFFFF0606);
}

class MaterialColorCustom {
  static int _blueThemeValue = 0xFF0054A6;
  static MaterialColor primaryBlue = MaterialColor(
    _blueThemeValue,
    <int, Color>{
      50: Color(0xFF0054A6),
      100: Color(0xFF0054A6),
      200: Color(0xFF0054A6),
      300: Color(0xFF0054A6),
      400: Color(0xFF0054A6),
      500: Color(_blueThemeValue),
      600: Color(0xFF0054A6),
      700: Color(0xFF0054A6),
      800: Color(0xFF0054A6),
      900: Color(0xFF0054A6),
    },
  );
}
