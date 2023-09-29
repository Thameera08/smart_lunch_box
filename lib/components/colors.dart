import 'package:flutter/material.dart';

class AppColor {
  static const Color textColor = Color(0xFFccc7c5);
  static const Color btnColor = Color.fromARGB(255, 6, 134, 19);
  static const Color mainColor = Color.fromARGB(255, 6, 134, 19);
}

// ignore: prefer_const_constructors
Color customColor = Color.fromARGB(255, 6, 134, 19); // Your custom color

// Create a MaterialColor based on the custom color
MaterialColor customMaterialColor = MaterialColor(
  customColor.value,
  <int, Color>{
    50: customColor.withOpacity(0.1),
    100: customColor.withOpacity(0.2),
    200: customColor.withOpacity(0.3),
    300: customColor.withOpacity(0.4),
    400: customColor.withOpacity(0.5),
    500: customColor.withOpacity(0.6),
    600: customColor.withOpacity(0.7),
    700: customColor.withOpacity(0.8),
    800: customColor.withOpacity(0.9),
    900: customColor.withOpacity(1.0),
  },
);
