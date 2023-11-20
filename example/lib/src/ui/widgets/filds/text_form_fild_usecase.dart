import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'package:widgetbook/widgetbook.dart' as knobs;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../../core/mask_input_controller.dart';

@UseCase(name: "Default", type: CwTextFormFild)
Widget cwTextFormFildUseCase(BuildContext context) {
  final passwordEC = TextEditingController();
  final label = context.knobs.string(label: "Label", description: "String", initialValue: "Label");
  final obscureText = context.knobs.boolean(label: "Obscure Text", description: "Password", initialValue: false);
  final form = GlobalKey<FormState>();
  return Form(
    key: form,
    autovalidateMode: AutovalidateMode.always,
    child: Container(
      color: context.color.primaryBG,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CwTextFormFild(
                label: "Valido 1*",
                obscureText: obscureText,
              ),
              CwTextFormFild(
                label: "Nome*",
                obscureText: obscureText,
              ),
              const CwTextFormFild(
                label: "Nome*",
                obscureText: true,
              ),
              CwTextFormFild(
                label: "Valido*",
                // maskUtils: MaskIC.email(context),
                obscureText: obscureText,
              ),
              CwTextFormFild(
                label: "Password*",
                controller: passwordEC,
                maskUtils: MaskUtils.password(context, customValidate: (value) {
                  return null;
                }),
                obscureText: obscureText,
              ),
              CwTextFormFild(
                label: "Nome*",
                obscureText: obscureText,
              ),
              CwTextFormFild(
                label: "Nome*",
                obscureText: obscureText,
              ),
              CwTextFormFild(
                label: "Nome*",
                obscureText: obscureText,
              ),
              CwTextFormFild(
                label: "Nome*",
                obscureText: obscureText,
              ),
              CwTextFormFild(
                label: "Nome*",
                obscureText: obscureText,
              ),
              CwTextFormFild(
                label: "Nome*",
                obscureText: obscureText,
              ),
              CwTextFormFild(
                label: "Nome*",
                obscureText: obscureText,
              ),
              CwTextFormFild(
                label: "Nome*",
                obscureText: obscureText,
              ),
              CwButton(
                  label: "Validate",
                  onPressed: () {
                    form.currentState?.validate();
                    // focusNode.requestFocus();
                  })
            ],
          ),
        ),
      ),
    ),
  );
}
