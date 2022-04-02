import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../asset_strings.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      // primarySwatch: MaterialColorCustom.primaryBlue,
      fontFamily: AssetStrings.poppinsRegular,
      appBarTheme: appBarTheme(),
      textTheme: textTheme(),
      inputDecorationTheme: inputDecorationTheme());
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      color: AppColors.appBlackColor,
      elevation: 2,
      brightness: Brightness.dark);
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: AppColors.appBlackColor),
    bodyText2: TextStyle(color: AppColors.appBlackColor),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: ColorUtils.inputLabelColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder);
}

class ColorUtils {
  static const Color inputLabelColor = Color(0xff818386);
  static const Color textColor = Color(0xff6A6A6B);
  static const Color WHITE_COLOR_BACKGROUND = Color(0xFFFFFFFF);
  static const Color GREEN_ICONS = Color(0xFF08C25E);
  static const Color BLACK_LABELS = Color(0xFF303030);
  static const Color ORANGE_ICON = Color(0xFFFFB930);
  static const Color GREY_COLOR = Colors.grey;
  static const Color ORANGE_ACCENT_BACKROUND = Color(0xFFFFF3E5);
  static const Color REDDISH_ACCENT_BACKGROUND = Color(0xFFFFE5E5);
  static const Color LIGHT_GREEN_ACCENT_BACKGROUND = Color(0xFFEDFFE5);
  static const Color LIGHT_GREEN_LABELS = Color(0xFF08C25E);
  static const Color RED_LABLES = Color(0xFFFF3030);
  static const Color DARK_GREY = Color(0xFF5D5E5E);
}
