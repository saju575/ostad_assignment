import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle regular = const TextStyle(
    // Use the font family name from pubspec.yaml
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static TextStyle appBarText = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.3,
      color: Colors.white);
}
