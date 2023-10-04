// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/widgets.dart';

/// Variables has multiplicator:
/// [none] = 0;
/// [s] = 1;
/// [m] = 2;
/// [l] = 3;
/// [xl] = 4;
/// [xxl] = 5;
/// [exl] = 6;
/// [exxl] = 7;
/// [header] = 8;
///
/// This multiplicator is multi with [spacerValue], and this [spacerValue] is:
/// [spacerValue] = 8
class Sz {
  Sz._();
  static double none = 0;
  static double s = 1;
  static double m = 2;
  static double l = 3;
  static double xl = 4;
  static double xxl = 5;
  static double exl = 6;
  static double exxl = 7;
  static double header = 8;
}

const double _spacerValue = 8;

extension ExtensionFromDouble on double {
  double get value => _spacerValue * this;

  SizedBox get sizedBoxH => SizedBox(height: _spacerValue * this);
  SizedBox get sizedBoxW => SizedBox(width: _spacerValue * this);
  SizedBox get sizedBoxHW => SizedBox(height: _spacerValue * this, width: _spacerValue * this);

  EdgeInsets get paddingLeft => EdgeInsets.fromLTRB(_spacerValue * this, 0, 0, 0);
  EdgeInsets get paddingTop => EdgeInsets.fromLTRB(0, _spacerValue * this, 0, 0);
  EdgeInsets get paddingRight => EdgeInsets.fromLTRB(0, 0, _spacerValue * this, 0);
  EdgeInsets get paddingBottom => EdgeInsets.fromLTRB(0, 0, 0, _spacerValue * this);
  EdgeInsets get paddingHorizontal => EdgeInsets.symmetric(horizontal: _spacerValue * this);
  EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: _spacerValue * this);
  EdgeInsets get paddingAll => EdgeInsets.all(_spacerValue * this);

  BorderRadius get borderRadiusTopLeft => BorderRadius.only(topLeft: Radius.circular(_spacerValue * this));
  BorderRadius get borderRadiusTopRight => BorderRadius.only(topRight: Radius.circular(_spacerValue * this));
  BorderRadius get borderRadiusBottomLeft => BorderRadius.only(bottomLeft: Radius.circular(_spacerValue * this));
  BorderRadius get borderRadiusBottomRight => BorderRadius.only(bottomRight: Radius.circular(_spacerValue * this));
  BorderRadius get borderRadiusAll => BorderRadius.all(Radius.circular(_spacerValue * this));
}
