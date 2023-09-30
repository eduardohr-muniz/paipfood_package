import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook/widgetbook.dart' as knobs;

@UseCase(name: "Default", type: CwButton)
Widget cWButtonUsecase(BuildContext context) {
  final label = context.knobs.string(label: "Label", initialValue: "Click");
  return Column(
    children: [
      Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: 1.0.borderRadiusAll,
        ),
      ),
      Center(
        child: CwButton(
          label: label,
          onPressed: () => debugPrint("pressed"),
        ),
      ),
    ],
  );
}
