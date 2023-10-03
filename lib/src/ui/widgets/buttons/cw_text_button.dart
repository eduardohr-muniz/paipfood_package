import 'package:flutter/material.dart';

import '../../../../paipfood_package.dart';

class CwTextButton extends StatelessWidget {
  final IconData? icon;
  final String label;
  final Color? colorText;
  final EdgeInsetsGeometry? padding;
  final void Function()? onPressed;
  const CwTextButton({
    required this.label,
    required this.onPressed,
    Key? key,
    this.icon,
    this.colorText,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: padding,
        minimumSize: padding != null ? const Size(0, 0) : const Size(60, 45),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(
                    icon,
                    color: context.color.primaryBG,
                  ),
                )
              : const SizedBox.shrink(),
          Text(
            label,
            style: TextStyle(color: colorText ?? context.color.primaryText),
          ),
        ],
      ),
    );
  }
}
