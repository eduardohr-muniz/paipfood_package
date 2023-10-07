import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'package:widgetbook/widgetbook.dart' as knobs;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: "Default", type: CwTextFormFild)
Widget cwTextFormFildUseCase(BuildContext context) {
  final label = context.knobs.string(label: "Label", description: "String", initialValue: "Label");
  final obscureText = context.knobs.boolean(label: "Obscure Text", description: "Password", initialValue: false);
  return Container(
    width: 500,
    height: 500,
    color: context.color.surface,
    child: FractionallySizedBox(
      widthFactor: 0.5,
      child: Container(
        color: context.color.primaryBG,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CwTextFormFild(
            label: "Nome*",
            obscureText: obscureText,
            expanded: true,
          ),
        ),
      ),
    ),
  );
}
