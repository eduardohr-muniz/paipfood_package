import 'package:paipfood_package/paipfood_package.dart';

extension StringExtension on String {
  String i18n() {
    final i = mapI18n[this];
    return i ?? this;
  }
}
