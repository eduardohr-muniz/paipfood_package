import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'package:widgetbook/widgetbook.dart' as knobs;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: "Default", type: CwSwitchLightDark)
Widget cwSwitchLightDarkUsecase(BuildContext context) {
  final isDarkMode = context.knobs.boolean(label: "IsDarkMode", initialValue: false);
  return Center(
      child: CwSwitchLightDark(
    isDarkMode: isDarkMode,
    onChanged: (value) {},
  ));
}
