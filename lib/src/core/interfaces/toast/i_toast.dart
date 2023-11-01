import 'package:flutter/material.dart';

abstract class IToast {
  void showSucess(String message, {String? label});
  void showInfo(String message, {String? label});
  void showError(String message, {String? label});
  void showCustom(String message, {String? label, Color? color, Widget? icon});
}
