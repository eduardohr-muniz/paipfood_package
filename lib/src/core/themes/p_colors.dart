import 'package:flutter/material.dart';

import 'package:paipfood_package/src/core/extensions/context_extension.dart';

extension MaterialColorExtendion on MaterialColor {
  Color get get0 => this[0] ?? this[50]!;
  Color get get50 => this[50]!;
  Color get get100 => this[100]!;
  Color get get200 => this[200]!;
  Color get get300 => this[300]!;
  Color get get400 => this[400]!;
  Color get get500 => this[500]!;
  Color get get600 => this[600]!;
  Color get get700 => this[700]!;
  Color get get800 => this[800]!;
  Color get get900 => this[900]!;
  Color get get950 => this[950]!;
  Color get get1000 => this[1000] ?? this[900]!;
}

class PColors extends ThemeExtension<PColors> {
  static MaterialColor neutral_ = const MaterialColor(0xfffafafa, <int, Color>{
    0: Color(0xffffffff),
    50: Color(0xfffafafa),
    100: Color(0xfff4f4f5),
    200: Color(0xffe4e4e7),
    300: Color(0xffd4d4d8),
    400: Color(0xffa1a1aa),
    500: Color(0xff71717a),
    600: Color(0xff52525b),
    700: Color(0xff3f3f46),
    800: Color(0xff27272a),
    900: Color(0xff18181b),
    950: Color(0xff09090b),
    1000: Color(0xff000000),
  });

//*COLORS
  static const Color primaryColor_ = Color(0xff49A568);
  static const Color tertiaryColor_ = Color(0xfffab70a);
  static const Color blackColor_ = Color(0xff030401);
  static const Color errorColorL_ = Colors.red;
  static const Color errorColorD_ = Colors.redAccent;
  //?light

  static const Color secondaryColorL_ = Color(0xff8257e5);

  //?Dark

  static const Color secondaryColorD_ = Color(0xff8257e5);

//*PARAMS
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color errorColor;
  final Color surface;
  final Color primaryBG;
  final Color onPrimaryBG;
  final Color primaryText;
  final Color secondaryText;
  final MaterialColor neutral;
  final Color neutral50;
  final Color neutral100;
  final Color neutral200;
  final Color neutral300;
  final Color neutral400;
  final Color neutral500;
  final Color neutral600;
  final Color neutral700;
  final Color neutral800;
  final Color neutral900;
  final Color neutral950;
  final Color neutral1000;

  PColors._(
      {required this.primaryColor,
      required this.secondaryColor,
      required this.tertiaryColor,
      required this.errorColor,
      required this.primaryBG,
      required this.surface,
      required this.onPrimaryBG,
      required this.primaryText,
      required this.secondaryText,
      required this.neutral,
      required this.neutral50,
      required this.neutral100,
      required this.neutral200,
      required this.neutral300,
      required this.neutral400,
      required this.neutral500,
      required this.neutral600,
      required this.neutral700,
      required this.neutral800,
      required this.neutral900,
      required this.neutral950,
      required this.neutral1000});

  static PColors light = PColors._(
      primaryColor: primaryColor_,
      secondaryColor: secondaryColorL_,
      tertiaryColor: tertiaryColor_,
      errorColor: errorColorL_,
      surface: neutral_.get100,
      primaryBG: neutral_.get0,
      onPrimaryBG: neutral_.get50,
      primaryText: neutral_.get950,
      secondaryText: neutral_.get900,
      neutral: neutral_,
      neutral50: neutral_.get50,
      neutral100: neutral_.get100,
      neutral200: neutral_.get200,
      neutral300: neutral_.get300,
      neutral400: neutral_.get400,
      neutral500: neutral_.get500,
      neutral600: neutral_.get600,
      neutral700: neutral_.get700,
      neutral800: neutral_.get800,
      neutral900: neutral_.get900,
      neutral950: neutral_.get950,
      neutral1000: neutral_.get1000);
  static PColors dark = PColors._(
    primaryColor: primaryColor_,
    secondaryColor: secondaryColorD_,
    tertiaryColor: tertiaryColor_,
    errorColor: errorColorD_,
    surface: neutral_.get950,
    primaryBG: neutral_.get900,
    onPrimaryBG: neutral_.get800,
    primaryText: neutral_.get50,
    secondaryText: neutral_.get300,
    neutral: neutral_,
    neutral50: neutral_.get1000,
    neutral100: neutral_.get950,
    neutral200: neutral_.get900,
    neutral300: neutral_.get800,
    neutral400: neutral_.get700,
    neutral500: neutral_.get600,
    neutral600: neutral_.get500,
    neutral700: neutral_.get400,
    neutral800: neutral_.get300,
    neutral900: neutral_.get200,
    neutral950: neutral_.get100,
    neutral1000: neutral_.get50,
  );

  @override
  PColors lerp(PColors? other, double t) {
    if (other is! PColors) return this;
    return PColors._(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      tertiaryColor: Color.lerp(tertiaryColor, other.tertiaryColor, t)!,
      errorColor: Color.lerp(errorColor, other.errorColor, t)!,
      primaryBG: Color.lerp(primaryBG, other.primaryBG, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onPrimaryBG: Color.lerp(onPrimaryBG, other.onPrimaryBG, t)!,
      primaryText: Color.lerp(primaryText, other.primaryText, t)!,
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t)!,
      neutral: neutral,
      neutral50: Color.lerp(secondaryText, other.secondaryText, t)!,
      neutral100: Color.lerp(secondaryText, other.secondaryText, t)!,
      neutral200: Color.lerp(secondaryText, other.secondaryText, t)!,
      neutral300: Color.lerp(secondaryText, other.secondaryText, t)!,
      neutral400: Color.lerp(secondaryText, other.secondaryText, t)!,
      neutral500: Color.lerp(secondaryText, other.secondaryText, t)!,
      neutral600: Color.lerp(secondaryText, other.secondaryText, t)!,
      neutral700: Color.lerp(secondaryText, other.secondaryText, t)!,
      neutral800: Color.lerp(secondaryText, other.secondaryText, t)!,
      neutral900: Color.lerp(secondaryText, other.secondaryText, t)!,
      neutral950: Color.lerp(secondaryText, other.secondaryText, t)!,
      neutral1000: Color.lerp(secondaryText, other.secondaryText, t)!,
    );
  }

  @override
  PColors copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? errorColor,
    Color? primaryBG,
    Color? subBG,
    Color? secondaryBG,
    Color? primaryText,
    Color? secondaryText,
    Color? neutral50,
    MaterialColor? neutral,
    Color? neutral100,
    Color? neutral200,
    Color? neutral300,
    Color? neutral400,
    Color? neutral500,
    Color? neutral600,
    Color? neutral700,
    Color? neutral800,
    Color? neutral900,
    Color? neutral950,
    Color? neutral1000,
  }) {
    return PColors._(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      errorColor: errorColor ?? this.errorColor,
      surface: subBG ?? surface,
      primaryBG: primaryBG ?? this.primaryBG,
      onPrimaryBG: secondaryBG ?? onPrimaryBG,
      primaryText: primaryText ?? this.primaryText,
      secondaryText: secondaryText ?? this.secondaryText,
      neutral: neutral ?? this.neutral,
      neutral50: neutral50 ?? this.neutral50,
      neutral100: neutral100 ?? this.neutral100,
      neutral200: neutral200 ?? this.neutral200,
      neutral300: neutral300 ?? this.neutral300,
      neutral400: neutral400 ?? this.neutral400,
      neutral500: neutral500 ?? this.neutral500,
      neutral600: neutral600 ?? this.neutral600,
      neutral700: neutral700 ?? this.neutral700,
      neutral800: neutral800 ?? this.neutral800,
      neutral900: neutral900 ?? this.neutral900,
      neutral950: neutral950 ?? this.neutral950,
      neutral1000: neutral1000 ?? this.neutral1000,
    );
  }
}

class ThemeEditor extends StatelessWidget {
  final WidgetBuilder builder;
  final Color color;
  const ThemeEditor({
    required this.builder,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(extensions: [context.color.copyWith(primaryColor: color)]),
      child: Builder(builder: builder),
    );
  }
}
