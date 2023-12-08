import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook/widgetbook.dart' as knobs;

@UseCase(name: "Default", type: CwButton)
Widget cWButtonUsecase(BuildContext context) {
  final label = context.knobs.string(label: "Label", initialValue: "Click");
  final enable = context.knobs.boolean(label: "Enable", initialValue: true);
  final http = HttpDio();
  Future<String> press() async {
    await Future.delayed(2.seconds);
    return "Batatinha";
  }

  return Center(
    child: CwButton(
      enable: enable,
      label: label,
      onPressedFuture: () async {
        await Future.delayed(3.seconds);
        print("batatinha");
      },
      onPressed: () {
        http.get("https://teste");
        // toast.showError("message,d a dmasf,,a sf,asfjnigfabjsgaf, fajgsgvabf a,sfnjas fyatuvfa mmmahgfya fasf,adhayfaysvdg ");
        toast.showSucess("message");
      },
    ),
  );
}
