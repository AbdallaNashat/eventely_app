import 'package:eventely/core/theme/color_palette.dart';
import 'package:flutter/material.dart';

abstract class AppThemeManager{
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorPalette.white,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: ColorPalette.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
      selectedItemColor: ColorPalette.white,
      unselectedItemColor: ColorPalette.white,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      backgroundColor: ColorPalette.primaryColor,

    )
  );


  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: ColorPalette.dark,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: ColorPalette.dark,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        selectedItemColor: ColorPalette.white,
        unselectedItemColor: ColorPalette.white,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        backgroundColor: ColorPalette.dark,
      ),

  );

}