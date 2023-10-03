import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook/widgetbook.dart' as knobs;

@UseCase(name: "Default", type: DropButtonLocale)
Widget dropButtonLocaleUsecase(BuildContext context) {
  return Center(child: DropButtonLocale(
    onChanged: (p0) {
      print(p0);
    },
  ));
}
