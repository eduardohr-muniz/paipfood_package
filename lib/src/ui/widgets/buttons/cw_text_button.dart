import 'package:flutter/material.dart';

import '../../../../paipfood_package.dart';

class CwTextButton extends StatelessWidget {
  final IconData? icon;
  final String label;
  final Color? colorText;
  final EdgeInsetsGeometry? padding;
  final void Function()? onPressed;
  final bool enable;
  final bool autoToast;
  const CwTextButton({
    required this.label,
    required this.onPressed,
    Key? key,
    this.icon,
    this.colorText,
    this.padding,
    this.enable = true,
    this.autoToast = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: enable
          ? () {
              try {
                onPressed?.call();
              } catch (e) {
                if (autoToast) toast.showError(e.toString());
              }
            }
          : null,
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
          ).center,
        ],
      ),
    );
  }
}
