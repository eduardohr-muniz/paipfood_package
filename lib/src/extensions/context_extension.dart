part of 'package:paipfood_package/paipfood_package.dart';

extension ContextExtension on BuildContext {
  Color get primaryColor => ColorExtension.primaryColor;

  Color get greenSecondaryColor => ColorExtension.greenSecondaryColor;

  Color get secondaryColor => ColorExtension.secondaryColor;

  Color get tertiaryColor => ColorExtension.tertiaryColor;

  Color get alternateColor => ColorExtension.alternateColor;

  Color get primaryBgColor => Theme.of(this).brightness == Brightness.light
      ? ColorExtension.primaryBackgroundLight
      : ColorExtension.primaryBackgroundDark;

  Color get secondaryBgColor => Theme.of(this).brightness == Brightness.light
      ? ColorExtension.secondaryBackgroundLight
      : ColorExtension.secondaryBackgroundDark;

  Color get primaryTextColor =>
      Theme.of(this).brightness == Brightness.light ? ColorExtension.primaryTextLight : ColorExtension.primaryTextDark;

  Color get secondaryTextColor => Theme.of(this).brightness == Brightness.light
      ? ColorExtension.secondaryTextLight
      : ColorExtension.secondaryTextDark;

  // Color get focus => Theme.of(this).brightness == Brightness.light ? ColorExtension.focusLight : ColorExtension.focusDark;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ButtonStyle get buttonPrimary => ElevatedButton.styleFrom(fixedSize: const Size(100, 40));

  double get spaceheight => 20;

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get mqSw => MediaQuery.of(this).size.width;
  double get mqSh => MediaQuery.of(this).size.height;

  RegExp get rgxNumber => RegExp(r'\d+');

  InputDecorationTheme get inputDecorationThemePrimary => InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      filled: true,
      focusColor: primaryColor,
      hoverColor: primaryColor.withOpacity(0.2),
      prefixIconColor: primaryColor);
}
