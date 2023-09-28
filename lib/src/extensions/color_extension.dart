import 'package:flutter/material.dart';

class ColorExtension {
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color alternateColor;
  final Color primaryBG;
  final Color secondaryBG;
  final Color primaryText;
  final Color secondaryText;
  ColorExtension({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.alternateColor,
    required this.primaryBG,
    required this.secondaryBG,
    required this.primaryText,
    required this.secondaryText,
  });

  static ColorExtension light = ColorExtension(
    primaryColor: const Color(0xff49A568),
    secondaryColor: const Color(0xff233831),
    tertiaryColor: const Color(0xffceac5c),
    alternateColor: const Color(0xff7E121d),
    primaryBG: const Color(0xffF5F6FA),
    secondaryBG: const Color(0xffFfffff),
    primaryText: const Color(0xff121214),
    secondaryText: const Color(0xffababab),
  );
  static ColorExtension dark = ColorExtension(
    primaryColor: const Color(0xff49A568),
    secondaryColor: const Color(0xff233831),
    tertiaryColor: const Color(0xffceac5c),
    alternateColor: const Color(0xffbd3634),
    primaryBG: const Color(0xff191919),
    secondaryBG: const Color(0xff202024),
    primaryText: const Color(0xffF5F6FA),
    secondaryText: const Color(0xffababab),
  );

  ColorExtension copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? alternateColor,
    Color? primaryBG,
    Color? secondaryBG,
    Color? primaryText,
    Color? secondaryText,
  }) {
    return ColorExtension(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      alternateColor: alternateColor ?? this.alternateColor,
      primaryBG: primaryBG ?? this.primaryBG,
      secondaryBG: secondaryBG ?? this.secondaryBG,
      primaryText: primaryText ?? this.primaryText,
      secondaryText: secondaryText ?? this.secondaryText,
    );
  }
}
