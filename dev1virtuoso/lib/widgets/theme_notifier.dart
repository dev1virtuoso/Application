import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  Null get currentTheme => null;
  void setTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
