import 'package:flutter/material.dart';

class AppColor {
  static const Color textColor = Color(0xFFccc7c5);
  static const Color btnColor = Color.fromARGB(255, 19, 3, 143);
  static const Color mainColor = Color.fromARGB(255, 19, 3, 143);
}
Color customColor = const Color.fromARGB(255, 1, 34, 116); // Your custom color

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