import 'package:flutter/material.dart';
import '../../paipfood_package.dart';

extension ContextExtension on BuildContext {
  bool get isDarkTheme => Theme.of(this).brightness == Brightness.dark;
  // PColors get color => Theme.of(this).brightness == Brightness.light ? PColors.light : PColors.dark;
  PColors get color => Theme.of(this).extension<PColors>()!;

  ColorScheme get colorTheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  double get spacing => 20;

  ///Mediaquery.size.width[w]
  double get w => MediaQuery.sizeOf(this).width;

  ///Mediaquery.size.height[h]
  double get h => MediaQuery.sizeOf(this).height;

  ///Only numbers regex
  RegExp get rgxNumber => RegExp(r'\d+');
}
