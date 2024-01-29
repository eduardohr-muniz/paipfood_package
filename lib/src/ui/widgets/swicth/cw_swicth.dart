import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';

class CwSwicth extends StatelessWidget {
  final bool value;
  final void Function(bool value)? onChanged;
  const CwSwicth({
    required this.value,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      thumbColor: MaterialStatePropertyAll(value ? Colors.white : context.color.neutral.get300),
      trackOutlineColor: MaterialStatePropertyAll(value ? PColors.primaryColor_ : context.color.neutral.get500),
      onChanged: onChanged,
    );
  }
}
