import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Utils {
  static double stringToDouble(String text) {
    if (text != "") {
      text = text.replaceAll(".", "");
      text = text.replaceFirst(",", ".");
      return double.parse(text);
    } else {
      return 0.0;
    }
  }

  static String doubleToString(double value) {
    if (value == 0.0) {
      return " -- ";
    } else {
      return value.toString();
    }
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
}
