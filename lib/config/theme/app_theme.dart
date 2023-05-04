import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        // Set Material 3
        useMaterial3: true,

        // Set Dark Theme
        brightness: Brightness.dark,

        colorSchemeSeed: Colors.redAccent,
      );
}
