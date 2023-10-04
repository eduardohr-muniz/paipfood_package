import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'package:widgetbook/widgetbook.dart' as knobs;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: "Default", type: CwTextFormFild)
Widget cwTextFormFildUseCase(BuildContext context) {
  final label = context.knobs.string(label: "Label", description: "String", initialValue: "Label");
  final obscureText = context.knobs.boolean(label: "Obscure Text", description: "Password", initialValue: false);
  return Row(
    children: [
      CwTextFormFild(
        label: "fjsdkfbdsjfsdn f sfhbsdbf hbshfbs dfv sdfv f vh",
        obscureText: obscureText,
        expanded: true,
      ),
      Container(
        width: 300,
        height: 300,
        color: Colors.red,
      )
      // CwTextFormFild(
      //   label: label,
      //   obscureText: obscureText,
      // ),
    ],
  );
}
