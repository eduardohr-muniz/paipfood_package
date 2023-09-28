import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook/widgetbook.dart' as knobs;

@UseCase(name: "Default", type: CwOutlineButton)
Widget cWOutilineButtonUsecase(BuildContext context) {
  final label = context.knobs.string(label: "Label", initialValue: "Click");
  return Center(
    child: CwOutlineButton(
      label: label,
      onPressed: () => debugPrint("pressed"),
    ),
  );
}
