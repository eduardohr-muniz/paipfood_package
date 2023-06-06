part of 'package:paipfood_package/paipfood_package.dart';

class Messages {
  final BuildContext context;
  Messages._(this.context);

  factory Messages.of(BuildContext context) {
    return Messages._(context);
  }

  void showError(String message) => _showMessage(message, Colors.red, Colors.white);

  void showInfo(String message) => _showMessage(message, context.secondaryColor, Colors.white);

  void showSucess(String message) => _showMessage(message, context.primaryColor, Colors.black);

  void _showMessage(String message, Color color, Color colorText) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(message, style: TextStyle(fontSize: 22, color: colorText)),
        ),
        backgroundColor: color));
  }
}
