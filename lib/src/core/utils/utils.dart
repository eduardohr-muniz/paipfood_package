import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paipfood_package/paipfood_package.dart';

class Utils {
  static double _stringToDouble(String text) {
    if (text != "") {
      text = text.replaceAll(".", "");
      text = text.replaceFirst(",", ".");
      return double.parse(text);
    } else {
      return 0.0;
    }
  }

  static double stringToDouble(String text) {
    return double.tryParse(text) ?? _stringToDouble(text);
  }

  static String doubleToString(double value) {
    if (value == 0.0) {
      return " -- ";
    } else {
      return value.toString();
    }
  }

  static String generateUuid() {
    String uuid = "";
    uuid += generateRandomString(8);
    uuid += "-";
    uuid += generateRandomString(4);
    uuid += "-";
    uuid += generateRandomString(4);
    uuid += "-";
    uuid += generateRandomString(4);
    uuid += "-";
    uuid += generateRandomString(12);
    return uuid;
  }

  static String generateRandomString(int length) {
    final random = Random();
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    String result = '';

    for (int i = 0; i < length; i++) {
      result += chars[random.nextInt(chars.length)];
    }

    return result;
  }

  static String maskToString(String value, TextInputFormatter textInputFormatter) {
    final ec = TextEditingController(text: value);
    ec.value = textInputFormatter.formatEditUpdate(ec.value, ec.value);
    final result = ec.text;
    ec.dispose();
    return result;
  }

  static String maskUltisToString(String value, MaskInputController mask) {
    if (mask.inpuFormatters == null) return value;
    TextInputFormatter? textInputFormatter;
    // final lenght = value.length;
    textInputFormatter = mask.inpuFormatters![0];
    // try {
    //   if (mask.onlenghtMaskChange != null && lenght >= mask.onlenghtMaskChange!) textInputFormatter = mask.inpuFormatters![1];
    // } catch (_) {
    //   textInputFormatter = mask.inpuFormatters![0];
    // }
    final ec = TextEditingController(text: value);
    ec.value = textInputFormatter.formatEditUpdate(ec.value, ec.value);
    final result = ec.text;
    ec.dispose();
    return result;
  }

  static String onlyNumbersRgx(String text) {
    return text.replaceAll(RegExp(r'\D'), '');
  }

  static bool rgxHasMatch(RegExp regex, {required String value}) {
    return regex.hasMatch(value);
  }

  static bool validatePassword(String value) {
    final RegExp regex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$%^&*(),.?":{}|<>]).{7,}$');
    return regex.hasMatch(value);
  }

  static String onlyAlphanumeric(String value, {bool undereline = false}) {
    if (undereline) return value.replaceAll(RegExp(r'[^a-zA-Z0-9_]'), '').toLowerCase();
    return value.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();
  }

  static Map<String, dynamic> convertMapKeysToCamelCase(Map<String, dynamic> input) {
    final Map<String, dynamic> map = Map.from(input);
    final List<String> keys = map.keys.toList();
    for (String key in keys) {
      final String keyCamelCase = key.replaceAllMapped(
        RegExp(r'_[a-z]'),
        (match) => match[0]![1].toUpperCase(),
      );
      map[keyCamelCase] = map[key];
      map.remove(key);
    }
    return map;
  }
}
