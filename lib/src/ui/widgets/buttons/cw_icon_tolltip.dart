import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';

class CwIconTolltip extends StatelessWidget {
  final String tooltipMessage;
  final IconData? icon;
  final double? iconSize;
  const CwIconTolltip({
    required this.tooltipMessage,
    Key? key,
    this.icon,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
        message: tooltipMessage,
        child: Icon(
          icon ?? Icomoon.info_circle,
          size: iconSize,
        ));
  }
}
