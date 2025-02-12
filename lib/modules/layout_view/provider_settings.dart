import 'package:flutter/material.dart';

class ProviderSettings extends ChangeNotifier {


  String currentLanguage = "en";
  ThemeMode currentTheme = ThemeMode.light;

  final List <String> _languages = [
    "English",
    "عربي"
  ];

   List<String> get languages => _languages;

  final List <String> _themes = [
    "Light",
    "Dark"
  ];

  List<String> get themes => _themes;


  void setCurrentLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;

    notifyListeners();
  }

  void setCurrentTheme(ThemeMode newTheme)  {
    if (newTheme == currentTheme) return;
    currentTheme = newTheme;

    notifyListeners();
  }

  bool isDark (){
    return currentTheme == ThemeMode.dark;
  }
}
