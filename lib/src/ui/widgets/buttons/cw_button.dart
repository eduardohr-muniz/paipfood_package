import 'package:flutter/material.dart';

import 'package:paipfood_package/paipfood_package.dart';

class CwButton extends StatelessWidget {
  final IconData? icon;
  final String label;
  final bool enable;
  final void Function()? onPressed;
  const CwButton({
    required this.label,
    required this.onPressed,
    this.enable = true,
    Key? key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      icon: icon != null
          ? Icon(
              icon,
              color: context.color.primaryBG,
            )
          : const SizedBox.shrink(),
      label: Text(
        label,
        style: TextStyle(color: PColors.light.primaryBG),
      ),
      onPressed: enable ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: context.color.primaryColor,
        minimumSize: const Size(60, 45),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}
