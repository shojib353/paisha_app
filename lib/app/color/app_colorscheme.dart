import 'package:flutter/material.dart';

class AppColorScheme {
  // Light
  static const ColorScheme light = ColorScheme(
    brightness: Brightness.light,

    primary: Color(0xFF31B3B5),
    onPrimary: Colors.white,

    secondary: Color(0xFF2196F3),
    onSecondary: Colors.white,

    background: Color(0xFFF8FAFA),
    onBackground: Color(0xFF1C1C1C),

    surface: Colors.white,
    onSurface: Color(0xFF1C1C1C),

    error: Color(0xFFD32F2F),
    onError: Colors.white,
  );

  // Dark
  static const ColorScheme dark = ColorScheme(
    brightness: Brightness.dark,

    primary: Color(0xFF31B3B5),
    onPrimary: Colors.black,

    secondary: Color(0xFF64B5F6),
    onSecondary: Colors.black,

    background: Color(0xFF121212),
    onBackground: Colors.white,

    surface: Color(0xFF1E1E1E),
    onSurface: Colors.white,

    error: Color(0xFFEF5350),
    onError: Colors.black,
  );
}
