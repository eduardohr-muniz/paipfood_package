import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';

extension StringExtension on String {
  String i18n() {
    final i = mapI18n[this];
    return i ?? this;
  }
}

extension TextExtension on Text {
  Widget get center => Padding(padding: const EdgeInsets.only(bottom: 2), child: this);
}
