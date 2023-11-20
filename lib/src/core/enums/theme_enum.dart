import 'package:flutter/material.dart';

enum ThemeEnum {
  mars(Colors.red),
  star(Color(0xffffab00)),
  eclipse(Color(0xffef6c00)),
  cosmos(Color(0xff1a237e)),
  andromeda(Color(0xff00acc1)),
  celest(Color(0xff00695c)),
  paip(Color(0xff49A568)),
  galactica(Color(0xff7b1fa2)),
  sweet(Color(0xffff4081)),
  meteor(Color(0xff4e342e)),
  blackHole(Colors.black);

  final Color color;

  const ThemeEnum(this.color);

  static ThemeEnum fromMap(String value) {
    return ThemeEnum.values.firstWhere((element) => element.name == value);
  }
}
