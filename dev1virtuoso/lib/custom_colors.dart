import 'package:flutter/material.dart';

class CustomColors {
  static const MaterialColor customGrey = MaterialColor(
    _customGreyPrimaryValue,
    <int, Color>{
      50: Color(0xFFE7E7E7),
      100: Color(0xFFCFCFCF),
      200: Color(0xFFB6B6B6),
      300: Color(0xFF9E9E9E),
      400: Color(0xFF8B8B8B),
      500: Color(_customGreyPrimaryValue),
      600: Color(0xFF6E6E6E),
      700: Color(0xFF595959),
      800: Color(0xFF444444),
      900: Color(0xFF2C2C2C),
    },
  );
  static const int _customGreyPrimaryValue = 0xFF424242;
}
