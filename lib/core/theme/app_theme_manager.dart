import 'package:eventely/core/theme/color_palette.dart';
import 'package:flutter/material.dart';

abstract class AppThemeManager{
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorPalette.white,
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorPalette.dark,
  );
}