import 'package:flutter/material.dart';
import '../../paipfood_package.dart';

class ThemeCustom {
  ThemeCustom._();
  static final lightTheme = ThemeData(
    fontFamily: "Roboto",
    useMaterial3: true,
    scaffoldBackgroundColor: ColorExtension.light.primaryBG,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorExtension.light.secondaryColor,
      selectionColor: ColorExtension.light.primaryColor.withOpacity(0.5),
      selectionHandleColor: ColorExtension.light.secondaryColor,
    ),
    textTheme: text,
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      background: ColorExtension.light.primaryBG, //primaryBackGround
      onBackground: ColorExtension.light.secondaryText,
      surface: ColorExtension.light.secondaryBG, // secondary Backgorund
      onSurface: ColorExtension.light.primaryText,
      primary: ColorExtension.light.primaryColor,
      onPrimary: ColorExtension.light.primaryText,
      secondary: ColorExtension.light.secondaryColor,
      onSecondary: ColorExtension.light.primaryText,
      error: ColorExtension.light.alternateColor,
      onError: ColorExtension.light.primaryBG,
    ),
  );

  static final darkTheme = ThemeData(
    fontFamily: "Roboto",
    useMaterial3: true,
    scaffoldBackgroundColor: ColorExtension.dark.primaryBG,
    textTheme: text,
    brightness: Brightness.dark,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorExtension.light.secondaryColor,
      selectionColor: ColorExtension.light.primaryColor.withOpacity(0.5),
      selectionHandleColor: ColorExtension.light.secondaryColor,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      background: ColorExtension.dark.primaryBG, //primaryBackGround
      onBackground: ColorExtension.dark.secondaryText,
      surface: ColorExtension.dark.secondaryBG, // secondary Backgorund
      onSurface: ColorExtension.dark.primaryText,
      primary: ColorExtension.dark.primaryColor,
      onPrimary: ColorExtension.dark.primaryText,
      secondary: ColorExtension.dark.secondaryColor,
      onSecondary: ColorExtension.dark.primaryText,
      error: ColorExtension.dark.alternateColor,
      onError: ColorExtension.dark.primaryBG,
    ),
  );

  static const text = TextTheme(
    displayLarge: TextStyle(letterSpacing: 0),
    displayMedium: TextStyle(letterSpacing: 0),
    displaySmall: TextStyle(letterSpacing: 0),
    //
    headlineLarge: TextStyle(letterSpacing: 0),
    headlineMedium: TextStyle(letterSpacing: 0),
    headlineSmall: TextStyle(letterSpacing: 0),
    //
    titleLarge: TextStyle(letterSpacing: 0),
    titleMedium: TextStyle(letterSpacing: 0),
    titleSmall: TextStyle(letterSpacing: 0.5),
    //
    labelLarge: TextStyle(fontSize: 16, letterSpacing: 0.5),
    labelMedium: TextStyle(fontSize: 14, letterSpacing: 0.5),
    labelSmall: TextStyle(fontSize: 13, letterSpacing: 0.5),
    //
    bodyLarge: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0),
    bodyMedium: TextStyle(letterSpacing: 0),
    bodySmall: TextStyle(letterSpacing: 0),
  );
}
