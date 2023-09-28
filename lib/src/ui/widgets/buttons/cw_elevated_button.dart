import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';

class CwElevatedButton extends StatelessWidget {
  final IconData? icon;
  final String label;
  final void Function()? onPressed;
  const CwElevatedButton({
    Key? key,
    this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: icon != null
          ? Icon(
              icon,
              color: context.color.primaryBG,
            )
          : const SizedBox.shrink(),
      label: Text(
        label,
        style: TextStyle(color: context.color.primaryBG),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: context.color.primaryColor),
    );
  }
}
