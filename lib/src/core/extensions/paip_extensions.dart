import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';

// extension InterableExtension on Iterable {
//   List<Map> toMapList() => map((e) => e as Map<String, dynamic>).toList();
//   Set addToSet(dynamic value) {
//     return {...this, value};
//   }

//   Set addToSetBuild(dynamic value) {
//     return {...this, value};
//   }
// }

extension ListExtension on List {
  List<Map> toMapList() => map((e) => e as Map<String, dynamic>).toList();
  Set addToSet(dynamic value) {
    return {...this, value};
  }

  void addClone({required dynamic origin, required dynamic clone}) {
    remove(origin);
    add(clone);
  }
}

extension DateTimeExtension on DateTime {
  String get toTimesTamptzFormat => toIso8601String();
}

extension WidgetExtension on Widget {
  Widget get excludeFocus => ExcludeFocus(child: this);
}

extension MapExtension on Map {
  bool contains({required String key, required String value}) {
    return this[key]?.toUpperCase().contains(value.toUpperCase()) ?? false;
  }

  bool startsWith({required String key, required String value}) {
    return this[key]?.toUpperCase().startsWith(value.toUpperCase()) ?? false;
  }
}

extension NumExtension on num {
  String get toStringCurrency => "${"currency".i18n()} ${Utils.maskUltisToString(toStringAsFixed(2), MaskUtils.currency())}";

  bool isInRange({required num min, required num max}) {
    final result = this >= min && this <= max;
    return result;
  }
}

extension StringExtension on String {
  String i18n() {
    final i = mapI18n[this];
    return i ?? this;
  }

  String get toCurrency => Utils.maskUltisToString(this, MaskUtils.currency());
}

extension TextExtension on Text {
  Widget get center => Padding(padding: const EdgeInsets.only(bottom: 2), child: this);
}
