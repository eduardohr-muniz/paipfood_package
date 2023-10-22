import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook/widgetbook.dart' as knobs;

@UseCase(name: "Default", type: Container)
Widget cWEmptyStateUsecase(BuildContext context) {
  final label = context.knobs.string(label: "Label", initialValue: "Click");
  final enable = context.knobs.boolean(label: "Enable", initialValue: true);
  return const Center(
      child: CwEmptyState(
    icon: Icomoon.alarm,
    size: 90,
  ));
}
