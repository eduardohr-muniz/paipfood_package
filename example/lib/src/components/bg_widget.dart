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
        width: double.infinity,
        color: context.color.secondaryBG,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          child: child,
        ),
      ),
    );
  }
}
