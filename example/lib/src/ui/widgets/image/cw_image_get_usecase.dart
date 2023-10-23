import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook/widgetbook.dart' as knobs;

@UseCase(name: "Default", type: CwImageGet)
Widget cWImageGetUsecase(BuildContext context) {
  final label = context.knobs.string(label: "Label", initialValue: "Click");
  final enable = context.knobs.boolean(label: "Enable", initialValue: true);
  return CwImageGet(
    onTap: () {
      debugPrint("OnTap");
    },
    onDelete: () {
      debugPrint("OnDelete");
    },
    height: 200,
    width: 200,
    pathImage:
        "https://media.istockphoto.com/id/1165399909/pt/foto/delicious-meal-on-a-black-plate-top-view-copy-space.jpg?s=612x612&w=0&k=20&c=Zt0CWTM1voz6mmGk1NS6EG5DOPWNr9qWVV82tkmkLJo=",
  );
}
