// theme_provider.dart
import 'package:flutter/material.dart';

const Color customPrimaryColor = Color(0xFF1A237E); // Dark Bluish color
const Color customSecondaryColor = Color(0xFFFF6D00); // Orange color

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider({bool isDarkMode = false})
      : _themeData = ThemeData(
          useMaterial3: true, // Enable Material 3
          colorScheme: ColorScheme.fromSeed(
            seedColor: customPrimaryColor,
            primary: customPrimaryColor,
            secondary: customSecondaryColor,
            brightness: isDarkMode ? Brightness.dark : Brightness.light,
          ),
        );

  ThemeData get themeData => _themeData;

  void toggleTheme(bool isDarkMode) {
    _themeData = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: customPrimaryColor,
        primary: customPrimaryColor,
        secondary: customSecondaryColor,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
    );
    notifyListeners();
  }
}
