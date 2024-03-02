// part of 'package:paipfood_package/paipfood_package.dart';
import 'dart:async';

class Debounce {
  int? miliseconds;

  Completer? _completer;
  Timer? _timer;

  Debounce({this.miliseconds = 500});

  void dispose() {
    _completer?.complete();
    _timer?.cancel();
  }

  Future<void> startTimer({required String value, required FutureOr<void> Function() onComplete, required int lenght}) async {
    if (_completer?.isCompleted == false) _completer?.complete();
    _timer?.cancel();
    _completer = Completer();
    _timer = Timer(Duration(milliseconds: miliseconds!), () async {
      if (value.length >= lenght) {
        await onComplete.call();
        if (_completer?.isCompleted == false) _completer?.complete();
      }
    });
    return _completer?.future;
  }
}
