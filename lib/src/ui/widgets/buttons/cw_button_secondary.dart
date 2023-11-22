import 'package:flutter/material.dart';

import 'package:paipfood_package/paipfood_package.dart';

class CwButtonSecondary extends StatelessWidget {
  final IconData? icon;
  final String label;
  final bool enable;
  final void Function()? onPressed;
  final Color color;
  const CwButtonSecondary({
    required this.label,
    required this.onPressed,
    Key? key,
    this.icon,
    this.enable = true,
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
        style: TextStyle(color: color),
      ),
      onPressed: enable ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withOpacity(0.25),
        foregroundColor: color.withOpacity(0.25),
        shadowColor: color.withOpacity(0.25),
        minimumSize: const Size(60, 45),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}
