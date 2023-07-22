part of 'package:paipfood_package/paipfood_package.dart';

class CustomThemeExtension {
  CustomThemeExtension._();
  ColorExtension colorExtension = ColorExtension();

  static final lightTheme = ThemeData(
    fontFamily: "Roboto",
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: ColorExtension.primaryTextLight),
    ),
    filledButtonTheme: FilledButtonThemeData(
        style:
            FilledButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)), minimumSize: const Size(80, 45))),
    scaffoldBackgroundColor: ColorExtension.primaryBackgroundLight,
    textTheme: extTextTheme,
    brightness: Brightness.light,
    primaryColor: ColorExtension.primaryColor,
    primaryColorLight: ColorExtension.primaryColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: ColorExtension.primaryColor,
      onPrimary: Colors.white,
      secondary: ColorExtension.secondaryColor,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
  );

  static final darkTheme = ThemeData(
    fontFamily: "Roboto",
    useMaterial3: true,
    appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: ColorExtension.primaryTextDark)),
    scaffoldBackgroundColor: ColorExtension.primaryBackgroundDark,
    textTheme: extTextTheme,
    brightness: Brightness.dark,
    primaryColor: ColorExtension.primaryColor,
    primaryColorLight: ColorExtension.primaryColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: ColorExtension.primaryColor,
      onPrimary: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.black,
      error: ColorExtension.tertiaryColor,
      onError: Colors.white,
      background: ColorExtension.primaryBackgroundDark,
      onBackground: Colors.white,
      surface: Colors.grey,
      onSurface: Colors.white,
    ),
  );

  static const extTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 47,
      letterSpacing: 0,
    ),
    displayMedium: TextStyle(fontSize: 45, letterSpacing: 0),
    displaySmall: TextStyle(fontSize: 36, letterSpacing: 0),
    //
    headlineLarge: TextStyle(fontSize: 32, letterSpacing: 0),
    headlineMedium: TextStyle(fontSize: 28, letterSpacing: 0),
    headlineSmall: TextStyle(fontSize: 24, letterSpacing: 0),
    //
    titleLarge: TextStyle(fontSize: 22, letterSpacing: 0),
    titleMedium: TextStyle(fontSize: 16, letterSpacing: 0),
    titleSmall: TextStyle(fontSize: 14, letterSpacing: 0.5),
    //
    labelLarge: TextStyle(fontSize: 14, letterSpacing: 0.5),
    labelMedium: TextStyle(fontSize: 12, letterSpacing: 0.5),
    labelSmall: TextStyle(fontSize: 11, letterSpacing: 0.5),
    //
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0),
    bodyMedium: TextStyle(fontSize: 14, letterSpacing: 0),
    bodySmall: TextStyle(fontSize: 12, letterSpacing: 0),
  );
}
