import 'package:flutter/widgets.dart';
import 'package:paipfood_package/paipfood_package.dart';

class GetVariables {
  Toast? toast;

  void init(BuildContext context) {
    toast = toast ?? Toast.of(context);
  }
}
