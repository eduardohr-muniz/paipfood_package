import 'package:flutter/material.dart';

import 'package:paipfood_package/src/core/extensions/context_extension.dart';

class PColors extends ThemeExtension<PColors> {
//*COLORS
  static const Color primaryColor_ = Color(0xff49A568);
  static const Color secondaryColor_ = Color(0xffCAE97C);
  static const Color tertiaryColor_ = Color(0xffceac5c);
  static const Color blackColor_ = Color(0xff030401);
  static const Color errorColor_ = Color(0xff7E121d);
  //?light
  static const Color surfaceL_ = Color(0xffF5F6FA);
  static const Color primaryBGL_ = Color(0xffFFFFFF);
  static const Color onPrimaryBGL_ = Color(0xffF5F6FA);
  static const Color primaryTextL_ = Color(0xff121214);
  static const Color secondaryTextL_ = Color(0xffababab);
  //?Dark
  static const Color surfaceD_ = Color(0xff1c1c20);
  static const Color primaryBGD_ = Color(0xff202024);
  static const Color onPrimaryBGD_ = Color(0xff393b3f);
  static const Color primaryTextD_ = Color(0xffd6d6d7);
  static const Color secondaryTextD_ = Color(0xff9a9a9c);

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

  PColors._({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.errorColor,
    required this.primaryBG,
    required this.surface,
    required this.onPrimaryBG,
    required this.primaryText,
    required this.secondaryText,
  });

  static PColors light = PColors._(
    primaryColor: primaryColor_,
    secondaryColor: secondaryColor_,
    tertiaryColor: tertiaryColor_,
    errorColor: errorColor_,
    surface: surfaceL_,
    primaryBG: primaryBGL_,
    onPrimaryBG: onPrimaryBGL_,
    primaryText: primaryTextL_,
    secondaryText: secondaryTextL_,
  );
  static PColors dark = PColors._(
    primaryColor: primaryColor_,
    secondaryColor: secondaryColor_,
    tertiaryColor: tertiaryColor_,
    errorColor: errorColor_,
    surface: surfaceD_,
    primaryBG: primaryBGD_,
    onPrimaryBG: onPrimaryBGD_,
    primaryText: primaryTextD_,
    secondaryText: secondaryTextD_,
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
