import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';

class BgWidget extends StatelessWidget {
  final Widget child;
  final Color? bgColor;

  const BgWidget({Key? key, required this.child, this.bgColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: context.secondaryBgColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      ),
    );
  }
}
