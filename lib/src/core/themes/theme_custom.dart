import 'package:flutter/material.dart';
import '../../../paipfood_package.dart';

class ThemeCustom {
  ThemeCustom._();
  static final lightTheme = ThemeData(
    fontFamily: "Roboto",
    useMaterial3: true,
    scaffoldBackgroundColor: PColors.light.surface,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: PColors.light.primaryColor,
      selectionColor: PColors.light.primaryColor.withOpacity(0.5),
      selectionHandleColor: PColors.light.primaryColor,
    ),
    appBarTheme: AppBarTheme(backgroundColor: PColors.neutral_.get50, surfaceTintColor: PColors.neutral_.get50),
    textTheme: text,
    dialogTheme: DialogTheme(
      backgroundColor: PColors.light.primaryBG,
      surfaceTintColor: PColors.light.primaryBG,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    brightness: Brightness.light,
    extensions: [PColors.light],
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      background: PColors.light.surface, //primaryBackGround
      onBackground: PColors.light.secondaryText,
      surface: PColors.light.primaryBG, // secondary Backgorund
      onSurface: PColors.light.primaryText,
      primary: PColors.light.primaryColor,
      onPrimary: PColors.light.primaryText,
      secondary: PColors.light.primaryColor,
      onSecondary: PColors.light.primaryText,
      error: PColors.light.errorColor,
      onError: PColors.light.primaryBG,
    ),
  );

  static final darkTheme = ThemeData(
    fontFamily: "Roboto",
    useMaterial3: true,
    scaffoldBackgroundColor: PColors.dark.surface,
    textTheme: text,
    brightness: Brightness.dark,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: PColors.light.primaryColor,
      selectionColor: PColors.light.primaryColor.withOpacity(0.5),
      selectionHandleColor: PColors.light.primaryColor,
    ),
    appBarTheme: AppBarTheme(backgroundColor: PColors.neutral_.get950, surfaceTintColor: PColors.neutral_.get950),
    dialogTheme: DialogTheme(
      backgroundColor: PColors.dark.primaryBG,
      surfaceTintColor: PColors.dark.primaryBG,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    extensions: [PColors.dark],
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      background: PColors.dark.surface, //primaryBackGround
      onBackground: PColors.dark.secondaryText,
      surface: PColors.dark.primaryBG, // secondary Backgorund
      onSurface: PColors.dark.primaryText,
      primary: PColors.dark.primaryColor,
      onPrimary: PColors.dark.primaryText,
      secondary: PColors.dark.primaryColor,
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
    titleLarge: TextStyle(letterSpacing: 0, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(letterSpacing: 0, fontWeight: FontWeight.w500),
    titleSmall: TextStyle(letterSpacing: 0.5, fontWeight: FontWeight.w400),
    //
    labelLarge: TextStyle(fontSize: 16, letterSpacing: 0.5, fontWeight: FontWeight.w600),
    labelMedium: TextStyle(fontSize: 14, letterSpacing: 0.5, fontWeight: FontWeight.w500),
    labelSmall: TextStyle(fontSize: 13, letterSpacing: 0.5, fontWeight: FontWeight.w400),
    //
    bodyLarge: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0),
    bodyMedium: TextStyle(letterSpacing: 0, fontWeight: FontWeight.w500),
    bodySmall: TextStyle(letterSpacing: 0, fontWeight: FontWeight.w400),
  );
}
