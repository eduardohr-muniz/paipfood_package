import 'package:flutter/material.dart';
import '../../../../paipfood_package.dart';

class CwOutlineButton extends StatelessWidget {
  final IconData? icon;
  final String label;
  final void Function()? onPressed;
  const CwOutlineButton({
    required this.label,
    required this.onPressed,
    Key? key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: icon != null
          ? Icon(
              icon,
              color: context.color.primaryBG,
            )
          : const SizedBox.shrink(),
      label: Text(
        label,
        style: TextStyle(color: context.color.primaryColor),
      ),
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        // backgroundColor: context.color.primaryColor,
        minimumSize: const Size(60, 45),
        side: BorderSide(
          color: context.color.primaryColor,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}
