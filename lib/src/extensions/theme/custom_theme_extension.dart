part of 'package:paipfood_package/paipfood_package.dart';

class CustomThemeExtension {
  CustomThemeExtension._();
  ColorExtension colorExtension = ColorExtension();

  static FilledButtonThemeData filledButtonTheme = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      minimumSize: const Size(80, 40),
      elevation: 1,
    ),
  );

  static OutlinedButtonThemeData outlinedButtonTheme = OutlinedButtonThemeData(
    style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        minimumSize: const Size(80, 40),
        elevation: 1,
        backgroundColor: ColorExtension.primaryColor.withAlpha(35),
        side: const BorderSide(color: ColorExtension.primaryColor)),
  );
  static ElevatedButtonThemeData? elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      minimumSize: const Size(80, 40),
      elevation: 1,
    ),
  );

  static final lightTheme = ThemeData(
    fontFamily: "Roboto",
    useMaterial3: true,
    filledButtonTheme: filledButtonTheme,
    elevatedButtonTheme: elevatedButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    scaffoldBackgroundColor: ColorExtension.primaryBackgroundLight,
    textTheme: extTextTheme,
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: ColorExtension.primaryColor,
      onPrimary: Colors.white,
      secondary: ColorExtension.primaryTextLight,
      onSecondary: Colors.white,
      error: ColorExtension.alternateColor,
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
    filledButtonTheme: filledButtonTheme,
    elevatedButtonTheme: elevatedButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    scaffoldBackgroundColor: ColorExtension.primaryBackgroundDark,
    textTheme: extTextTheme,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: ColorExtension.primaryColorDark,
      onPrimary: Colors.white,
      secondary: ColorExtension.secondaryColor,
      onSecondary: Colors.black,
      error: ColorExtension.alternateColorDark,
      onError: Colors.white,
      background: ColorExtension.primaryBackgroundDark,
      onBackground: Colors.white,
      surface: Colors.grey,
      onSurface: Colors.white,
    ),
  );

  static const extTextTheme = TextTheme(
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
