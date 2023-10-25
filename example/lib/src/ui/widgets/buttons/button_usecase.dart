import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook/widgetbook.dart' as knobs;

@UseCase(name: "Default", type: CwButton)
Widget cWButtonUsecase(BuildContext context) {
  final label = context.knobs.string(label: "Label", initialValue: "Click");
  final enable = context.knobs.boolean(label: "Enable", initialValue: true);
  final toast = Toast.of(context);
  return Center(
    child: CwButton(
        enable: enable,
        label: label,
        onPressed: () {
          toast.sucess("message");
          toast.info("message");
          toast.error("message");
          toast.custom("message");
        }),
  );
}
