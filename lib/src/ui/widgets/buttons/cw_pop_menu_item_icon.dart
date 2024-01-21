import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';

class CwPopMenuItem extends PopupMenuItem {
  const CwPopMenuItem({required super.child, super.key, super.onTap});

  factory CwPopMenuItem.icon(BuildContext context, {required String label, required IconData icon, Color? iconColor, void Function()? onTap}) {
    return CwPopMenuItem(
        onTap: onTap,
        child: Row(
          children: [Icon(icon, color: iconColor, size: 18), Sz.i.sizedBoxW, Text(label, style: context.textTheme.bodySmall)],
        ));
  }
}
