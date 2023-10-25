import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:paipfood_package/paipfood_package.dart';

class GetVariablesDontContext {
  Toast? show;

  void init(BuildContext context) {
    show = Toast.of(context);
  }

  static Widget builder(BuildContext context, Widget? child) {
    return _BuildListener(
      child: child ?? const SizedBox.shrink(),
    );
  }
}

class _BuildListener extends StatelessWidget {
  final Widget child;
  const _BuildListener({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.get<GetVariablesDontContext>().init(context);
    return child;
  }
}
