// part of 'package:paipfood_package/paipfood_package.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class Debounce {
  int? miliseconds;

  TextEditingController textEditingController;
  Timer? _timer;

  Debounce({required this.textEditingController, this.miliseconds = 500}) {
    textEditingController.addListener(
      () {},
    );
  }

  void dispose() {
    _timer?.cancel();
  }

  void startTimer(VoidCallback? onTap) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: miliseconds!), () {
      if (textEditingController.text.length >= 7) onTap?.call();
    });
  }
}
