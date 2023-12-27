import 'package:flutter/material.dart';
import '../../../../paipfood_package.dart';

class CwOutlineButton extends StatelessWidget {
  final IconData? icon;
  final String label;
  final void Function()? onPressed;
  final Color color;
  final bool enable;
  final bool autoToast;
  const CwOutlineButton({
    required this.label,
    required this.onPressed,
    Key? key,
    this.icon,
    this.color = PColors.primaryColor_,
    this.enable = true,
    this.autoToast = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
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
      onPressed: enable
          ? () {
              try {
                onPressed?.call();
              } catch (e) {
                if (autoToast) toast.showError(e.toString());
              }
            }
          : null,
      style: OutlinedButton.styleFrom(
        // backgroundColor: color,
        minimumSize: const Size(60, 45),
        side: BorderSide(
          color: color,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}
