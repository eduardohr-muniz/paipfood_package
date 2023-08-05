part of '../../paipfood_package.dart';

double stringToDoubleTry(String text) {
  if (text != "") {
    text = text.replaceAll(".", "");
    text = text.replaceFirst(",", ".");
    return double.parse(text);
  } else {
    return 0.0;
  }
}
