import 'package:flutter/material.dart';

abstract class IToast {
  void sucess(String message, {String? label});
  void info(String message, {String? label});
  void error(String message, {String? label});
  void custom(String message, {String? label, Color? color, Widget? icon});
}
