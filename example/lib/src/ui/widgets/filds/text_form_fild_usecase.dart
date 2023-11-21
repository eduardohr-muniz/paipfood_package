import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'package:widgetbook/widgetbook.dart' as knobs;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: "Default", type: CwTextFormFild)
Widget cwTextFormFildUseCase(BuildContext context) {
  final passwordEC = TextEditingController();
  final label = context.knobs.string(label: "Label", description: "String", initialValue: "Label");
  final obscureText = context.knobs.boolean(label: "Obscure Text", description: "Password", initialValue: false);
  final form = GlobalKey<FormState>();
  return Form(
    key: form,
    // autovalidateMode: AutovalidateMode.always,
    child: Container(
      color: context.color.primaryBG,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CwTextFormFild(
                maskUtils: MaskUtils.phonePtBr(context),
                prefixIcon: Padding(
                  padding: 0.5.paddingHorizontal,
                  child: const FlagCountrySelector(enabled: true),
                ),
                label: "Phone",
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
