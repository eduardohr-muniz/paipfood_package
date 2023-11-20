import 'package:flutter/material.dart';

import 'package:paipfood_package/src/core/extensions/context_extension.dart';

class PColors extends ThemeExtension<PColors> {
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color errorColor;
  final Color surface;
  final Color primaryBG;
  final Color onPrimaryBG;
  final Color primaryText;
  final Color secondaryText;

  PColors({
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

  static PColors light = PColors(
    primaryColor: const Color(0xff49A568),
    secondaryColor: const Color(0xff233831),
    tertiaryColor: const Color(0xffceac5c),
    errorColor: const Color(0xff7E121d),
    surface: const Color(0xffF5F6FA),
    primaryBG: const Color(0xffFFFFFF),
    onPrimaryBG: const Color(0xffF5F6FA),
    primaryText: const Color(0xff121214),
    secondaryText: const Color(0xffababab),
  );
  static PColors dark = PColors(
    primaryColor: const Color(0xff49A568),
    secondaryColor: const Color(0xff233831),
    tertiaryColor: const Color(0xffceac5c),
    errorColor: const Color(0xffbd3634),
    surface: const Color(0xff1c1c20),
    primaryBG: const Color(0xff202024),
    onPrimaryBG: const Color(0xff393b3f),
    primaryText: const Color(0xffd6d6d7),
    secondaryText: const Color(0xff9a9a9c),
  );

  @override
  PColors lerp(PColors? other, double t) {
    if (other is! PColors) return this;
    return PColors(
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
    return PColors(
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
