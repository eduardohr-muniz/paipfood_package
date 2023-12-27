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
  var textEditingController = TextEditingController();
  var maskFormatter = MaskTextInputFormatter(mask: '(##) ####-####');
  final focus = List.generate(10, (index) => FocusNode());

  return Form(
    key: form,
    child: Container(
      color: context.color.primaryBG,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CwTextFormFild(
                maskUtils: MaskUtils.email(isRequired: true),
              ),
              const CwTextFormFild(
                  // maskUtils: MaskUtils.cRequired(),
                  ),
              CwTextFormFild(
                maskUtils: MaskUtils.cRequired(),
              ),
              CwTextFormFild(
                maskUtils: MaskUtils.cRequired(),
              ),
              CwTextFormFild(
                maskUtils: MaskUtils.cRequired(),
              ),
              CwTextFormFild(
                maskUtils: MaskUtils.cRequired(),
              ),
              CwTextFormFild(
                maskUtils: MaskUtils.cRequired(),
              ),
              CwTextFormFild(
                maskUtils: MaskUtils.cRequired(),
              ),
              CwTextFormFild(
                maskUtils: MaskUtils.cRequired(),
              ),
              CwTextFormFild(
                maskUtils: MaskUtils.cRequired(),
              ),
              CwTextFormFild(
                maskUtils: MaskUtils.cRequired(),
              ),
              CwTextFormFild(
                maskUtils: MaskUtils.cRequired(),
              ),
              CwTextFormFild(
                maskUtils: MaskUtils.cRequired(),
              ),
              CwTextFormFild(
                maskUtils: MaskUtils.cRequired(),
              ),
              CwTextFormFild(
                maskUtils: MaskUtils.cRequired(),
              ),
              CwTextFormFild(
                maskUtils: MaskUtils.cRequired(),
              ),
              CwTextFormFild(
                maskUtils: MaskUtils.cRequired(),
              ),
              CwTextFormFild(
                maskUtils: MaskUtils.cRequired(),
              ),
              CwTextFormFild(
                maskUtils: MaskUtils.cRequired(),
              ),
              CwTextFormFild(
                label: "Email",
                maskUtils: MaskUtils.email(isRequired: true),
              ),
              CwTextFormFild(
                maskUtils: MaskUtils.cRequired(),
              ),
              CwTextFormFild(
                maskUtils: MaskUtils.cRequired(),
              ),
              CwTextFormFild(
                maskUtils: MaskUtils.cRequired(),
              ),
              CwTextFormFild(
                maskUtils: MaskUtils.cRequired(),
              ),
              CwTextFormFild(
                maskUtils: MaskUtils.cRequired(),
              ),
              CwTextFormFild(
                maskUtils: MaskUtils.cRequired(),
              ),
              CwTextFormFild(
                maskUtils: MaskUtils.cRequired(isFinal: true),
              ),
              TextButton(
                  onPressed: () {
                    form.currentState?.validate();
                  },
                  child: const Text("validar"))
            ],
          ),
        ),
      ),
    ),
  );
}
