import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook/widgetbook.dart' as knobs;

@UseCase(name: "Default", type: CwTextButton)
Widget cWTextButtonUsecase(BuildContext context) {
  final label = context.knobs.string(label: "Label", initialValue: "Click");
  final colorText = context.knobs.color(label: "TextColor - ff+HEX (sem o #)", initialValue: context.color.primaryText);
  return Center(
    child: CwTextButton(
      label: label,
      colorText: colorText,
      onPressed: () => debugPrint("pressed"),
    ),
  );
}
