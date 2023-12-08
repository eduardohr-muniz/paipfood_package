// part of 'package:paipfood_package/paipfood_package.dart';
import 'dart:async';

class Debounce {
  int? miliseconds;

  Timer? _timer;

  Debounce({this.miliseconds = 500});

  void dispose() {
    _timer?.cancel();
  }

  void startTimer({required String value, required void Function() onTap, required int lenght}) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: miliseconds!), () {
      if (value.length >= lenght) {
        onTap.call();
      }
    });
  }
}
