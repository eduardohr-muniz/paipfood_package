import 'package:flutter/material.dart';

import '../../../../paipfood_package.dart';

class CwEmptyState extends StatelessWidget {
  final double size;
  final bool bgColor;
  final IconData? icon;
  final Color? iconColor;
  final String? label;
  const CwEmptyState({required this.size, this.icon, this.iconColor, this.bgColor = true, this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
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
        ),
        label != null ? Text(label ?? '') : const SizedBox.shrink()
      ],
    );
  }
}
