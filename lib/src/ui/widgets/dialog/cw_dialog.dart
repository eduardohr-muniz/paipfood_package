import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';

class CwDialog extends StatelessWidget {
  final MainAxisAlignment? actionsAlignment;
  final List<Widget>? actions;
  final Widget? title;
  final Widget? content;

  const CwDialog({
    Key? key,
    this.actionsAlignment,
    this.actions,
    this.title,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: actions,
      actionsAlignment: actionsAlignment,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          title != null ? title! : const SizedBox.shrink(),
          Sz.iii.sizedBoxW,
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icomoon.close_circle),
          ),
        ],
      ),
      content: content,
    );
  }
}
