import 'package:flutter/material.dart';

import 'package:paipfood_package/paipfood_package.dart';

class CwButton extends StatelessWidget {
  final IconData? icon;
  final String label;
  final bool enable;
  final void Function()? onPressed;
  final Color color;
  const CwButton({
    required this.label,
    required this.onPressed,
    this.enable = true,
    Key? key,
    this.icon,
    this.color = PColors.primaryColor_,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      icon: icon != null
          ? Icon(
              icon,
              color: color,
            )
          : const SizedBox.shrink(),
      label: Text(
        label,
        style: TextStyle(color: PColors.light.primaryBG),
      ),
      onPressed: enable ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(60, 45),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}
