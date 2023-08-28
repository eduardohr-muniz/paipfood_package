part of '../../../paipfood_package.dart';

double stringToDoubleTry(String text) {
  if (text != "") {
    text = text.replaceAll(".", "");
    text = text.replaceFirst(",", ".");
    return double.parse(text);
  } else {
    return 0.0;
  }
}

String doubleToStringTry(double value) {
  if (value == 0.0) {
    return "";
  } else {
    return value.toString();
  }
}

String generateRandomStringTry(int length) {
  final random = Random();
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  String result = '';

  for (int i = 0; i < length; i++) {
    result += chars[random.nextInt(chars.length)];
  }

  return result;
}

String maskToStringTry(String text, TextInputFormatter textInputFormatter) {
  final ec = TextEditingController(text: text);
  ec.value = textInputFormatter.formatEditUpdate(ec.value, ec.value);
  return ec.text;
}

String rgxOnlyNumbersTry(String text) {
  return text.replaceAll(RegExp(r'\D'), '');
}
