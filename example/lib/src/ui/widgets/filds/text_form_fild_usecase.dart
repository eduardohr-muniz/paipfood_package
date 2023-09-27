import 'package:example/src/components/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'package:widgetbook/widgetbook.dart' as knobs;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: "Default", type: CwTextFormFild)
Widget cwTextFormFildUseCase(BuildContext context) {
  final label = context.knobs.string(label: "Label", description: "", initialValue: "Label");
  return BgWidget(child: CwTextFormFild(label: label));
}
