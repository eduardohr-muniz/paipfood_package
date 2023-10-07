import 'package:flutter/material.dart';
import '../../paipfood_package.dart';

class ThemeCustom {
  ThemeCustom._();
  static final lightTheme = ThemeData(
    fontFamily: "Roboto",
    useMaterial3: true,
    scaffoldBackgroundColor: PColors.light.primaryBG,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: PColors.light.secondaryColor,
      selectionColor: PColors.light.primaryColor.withOpacity(0.5),
      selectionHandleColor: PColors.light.secondaryColor,
    ),
    textTheme: text,
    brightness: Brightness.light,
    extensions: [PColors.light],
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      background: PColors.light.primaryBG, //primaryBackGround
      onBackground: PColors.light.secondaryText,
      surface: PColors.light.surface, // secondary Backgorund
      onSurface: PColors.light.primaryText,
      primary: PColors.light.primaryColor,
      onPrimary: PColors.light.primaryText,
      secondary: PColors.light.secondaryColor,
      onSecondary: PColors.light.primaryText,
      error: PColors.light.errorColor,
      onError: PColors.light.primaryBG,
    ),
  );

  static final darkTheme = ThemeData(
    fontFamily: "Roboto",
    useMaterial3: true,
    scaffoldBackgroundColor: PColors.dark.primaryBG,
    textTheme: text,
    brightness: Brightness.dark,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: PColors.light.secondaryColor,
      selectionColor: PColors.light.primaryColor.withOpacity(0.5),
      selectionHandleColor: PColors.light.secondaryColor,
    ),
    extensions: [PColors.dark],
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      background: PColors.dark.primaryBG, //primaryBackGround
      onBackground: PColors.dark.secondaryText,
      surface: PColors.dark.surface, // secondary Backgorund
      onSurface: PColors.dark.primaryText,
      primary: PColors.dark.primaryColor,
      onPrimary: PColors.dark.primaryText,
      secondary: PColors.dark.secondaryColor,
      onSecondary: PColors.dark.primaryText,
      error: PColors.dark.errorColor,
      onError: PColors.dark.primaryText,
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
