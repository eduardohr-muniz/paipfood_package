import 'package:flutter/material.dart';
import '../../../../paipfood_package.dart';

class CwOutlineButton extends StatelessWidget {
  final IconData? icon;
  final String label;
  final void Function()? onPressed;
  final Color color;
  const CwOutlineButton({
    required this.label,
    required this.onPressed,
    Key? key,
    this.icon,
    this.color = PColors.primaryColor_,
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
      onPressed: onPressed,
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
