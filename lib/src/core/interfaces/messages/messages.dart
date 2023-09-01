import 'package:flutter/material.dart';
import 'package:paipfood_package/src/extensions/context_extension.dart';

import 'i_messages.dart';

class Messages implements IMessages {
  final BuildContext context;
  Messages._(this.context);

  @override
  void showError(String message) => _showMessage(message, context.tertiaryColor, Colors.white);

  @override
  void showInfo(String message) => _showMessage(message, context.secondaryColor, Colors.black);

  @override
  void showSucess(String message) => _showMessage(message, context.primaryColor, Colors.white);

  void _showMessage(String message, Color color, Color colorText) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(message, style: TextStyle(fontSize: 22, color: colorText)),
        ),
        backgroundColor: color));
  }
}
