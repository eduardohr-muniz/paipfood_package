import 'package:flutter/material.dart';

import 'package:paipfood_package/paipfood_package.dart';

class CwIconButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final IconData? icon;
  const CwIconButtonAppBar({
    Key? key,
    this.onPressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: onPressed ??
            () {
              Modular.to.pop();
            },
        icon: Icon(icon ?? Icons.arrow_back),
        style: IconButton.styleFrom(
            backgroundColor: context.color.neutral100.withOpacity(0.5), padding: EdgeInsets.zero, visualDensity: VisualDensity.comfortable),
      ),
    );
  }
}
