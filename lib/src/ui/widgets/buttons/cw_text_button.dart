import 'package:flutter/material.dart';

import '../../../../paipfood_package.dart';

class CwTextButton extends StatelessWidget {
  final IconData? icon;
  final String label;
  final Color? colorText;
  final void Function()? onPressed;
  const CwTextButton({
    required this.label,
    required this.onPressed,
    Key? key,
    this.icon,
    this.colorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: icon != null
          ? Icon(
              icon,
              color: context.color.primaryBG,
            )
          : const SizedBox.shrink(),
      label: Text(
        label,
        style: TextStyle(color: colorText ?? context.color.primaryText),
      ),
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: const Size(60, 45),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}
