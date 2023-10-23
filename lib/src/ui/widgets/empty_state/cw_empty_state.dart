import 'package:flutter/material.dart';

import '../../../../paipfood_package.dart';

class CwEmptyState extends StatelessWidget {
  final double size;
  final bool bgColor;
  final IconData icon;
  final Color? iconColor;
  const CwEmptyState({required this.size, required this.icon, this.iconColor, this.bgColor = true, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor ? context.color.primaryBG : null,
      width: size,
      height: size,
      child: Stack(
        children: [
          SvgPicture.asset(
            "assets/bg_empty_state.svg",
            package: "paipfood_package",
            fit: BoxFit.cover,
            height: size,
            width: size,
            colorFilter: ColorFilter.mode(context.color.onPrimaryBG, BlendMode.srcATop),
          ),
          Align(
            child: Icon(
              icon,
              color: iconColor ?? context.color.secondaryText,
              size: size * 0.55,
            ),
          ),
        ],
      ),
    );
  }
}
