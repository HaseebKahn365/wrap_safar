// theme_provider.dart
import 'package:flutter/material.dart';

const Color customPrimaryColor = Color(0xFF1A237E); // Dark Bluish color
const Color customSecondaryColor = Color(0xFFFF6D00); // Orange color
const Color tertiaryColor = Color(0xFFE6EBF5); // light blue color

//creating complimetary dark versions of the above colors

const Color customPrimaryColorDark = Color(0xFF0D163D);
const Color customSecondaryColorDark = Color(0xFFCC5800);
const Color tertiaryColorDark = Color.fromARGB(255, 18, 24, 37);

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider({bool isDarkMode = false})
      : _themeData = ThemeData(
          useMaterial3: true, // Enable Material 3
          colorScheme: ColorScheme.fromSeed(
            seedColor: customPrimaryColor,
            primary: customPrimaryColor,
            secondary: customSecondaryColor,
            tertiary: tertiaryColor,
            brightness: isDarkMode ? Brightness.dark : Brightness.light,
          ),
        );

  ThemeData get themeData => _themeData;

  void toggleTheme(bool isDarkMode) {
    _themeData = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: (isDarkMode) ? customPrimaryColorDark : customPrimaryColor,
        primary: (isDarkMode) ? customPrimaryColorDark : customPrimaryColor,
        secondary: (isDarkMode) ? customSecondaryColorDark : customSecondaryColor,
        tertiary: (isDarkMode) ? tertiaryColorDark : tertiaryColor,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
    );
    notifyListeners();
  }
}
