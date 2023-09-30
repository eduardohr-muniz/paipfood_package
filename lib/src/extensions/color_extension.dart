import 'package:flutter/material.dart';

import 'package:paipfood_package/src/extensions/context_extension.dart';

class PColors extends ThemeExtension<PColors> {
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color errorColor;
  final Color primaryBG;
  final Color secondaryBG;
  final Color primaryText;
  final Color secondaryText;

  PColors({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.errorColor,
    required this.primaryBG,
    required this.secondaryBG,
    required this.primaryText,
    required this.secondaryText,
  });

  static PColors light = PColors(
    primaryColor: const Color(0xff49A568),
    secondaryColor: const Color(0xff233831),
    tertiaryColor: const Color(0xffceac5c),
    errorColor: const Color(0xff7E121d),
    primaryBG: const Color(0xffF5F6FA),
    secondaryBG: const Color(0xffFfffff),
    primaryText: const Color(0xff121214),
    secondaryText: const Color(0xffababab),
  );
  static PColors dark = PColors(
    primaryColor: const Color(0xff49A568),
    secondaryColor: const Color(0xff233831),
    tertiaryColor: const Color(0xffceac5c),
    errorColor: const Color(0xffbd3634),
    primaryBG: const Color(0xff191919),
    secondaryBG: const Color(0xff202024),
    primaryText: const Color(0xffF5F6FA),
    secondaryText: const Color(0xffababab),
  );

  @override
  PColors lerp(PColors? other, double t) {
    if (other is! PColors) return this;
    return t > 0.5 ? other : this;
  }

  @override
  PColors copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? errorColor,
    Color? primaryBG,
    Color? secondaryBG,
    Color? primaryText,
    Color? secondaryText,
  }) {
    return PColors(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      errorColor: errorColor ?? this.errorColor,
      primaryBG: primaryBG ?? this.primaryBG,
      secondaryBG: secondaryBG ?? this.secondaryBG,
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
