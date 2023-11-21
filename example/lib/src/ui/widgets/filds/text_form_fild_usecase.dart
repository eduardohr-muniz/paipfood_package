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
              // CwTextFormFild(
              //   inputFormatters: [maskFormatter],
              //   controller: textEditingController,
              //   onChanged: (value) {
              //     final lenght = value.length;
              //     if (lenght >= 13 && lenght < 15) {
              //       textEditingController.value = maskFormatter.updateMask(mask: lenght == 13 ? "(##) ####-#####" : "(##) ####-#####");
              //     }
              //     if (value.length >= 15) textEditingController.value = maskFormatter.updateMask(mask: "(##)# ####-#####");
              //   },
              //   prefixIcon: Padding(
              //     padding: 0.5.paddingHorizontal,
              //     child: const FlagCountrySelector(enabled: true),
              //   ),
              //   label: "Phone",
              // ),
              CwTextFormFild(
                maskUtils: MaskUtils.phonePtBr(context, textEditingController: textEditingController),
                controller: textEditingController,
                label: "Phone",
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
