import 'package:flutter/material.dart';
import '../../paipfood_package.dart';

extension ContextExtension on BuildContext {
  bool get isLightTheme => Theme.of(this).brightness == Brightness.light;

  ColorExtension get color => Theme.of(this).brightness == Brightness.light ? ColorExtension.light : ColorExtension.dark;

  TextTheme get textTheme => Theme.of(this).textTheme;

  MaskInputExtension get maskInput => MaskInputExtension();

  double get spacing => 20;

  ///Mediaquery.size.width[w]
  double get w => MediaQuery.sizeOf(this).width;

  ///Mediaquery.size.height[h]
  double get h => MediaQuery.sizeOf(this).height;

  ///Only numbers regex
  RegExp get rgxNumber => RegExp(r'\d+');
}
