import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook/widgetbook.dart' as knobs;

@UseCase(name: "Default", type: CwTextButton)
Widget cWTextButtonUsecase(BuildContext context) {
  final label = context.knobs.string(label: "Label", initialValue: "Click");
  final colorText = context.knobs.color(label: "TextColor - ff+HEX (sem o #)", initialValue: context.color.primaryText);
  final padding = context.knobs.string(label: "Padding", initialValue: "8");
  return Center(
    child: CwTextButton(
      label: label,
      padding: EdgeInsets.all(double.parse("$padding.0")),
      colorText: colorText,
      onPressed: () => debugPrint("pressed"),
    ),
  );
}
