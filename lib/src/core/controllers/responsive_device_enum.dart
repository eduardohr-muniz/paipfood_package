import 'package:flutter/material.dart';

enum ResponsiveDevice {
  mobile(0),
  tablet(480),
  desktop(1024);

  final double minWidth;
  const ResponsiveDevice(this.minWidth);

  ResponsiveDevice _getDevice(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width > ResponsiveDevice.desktop.minWidth) {
      return ResponsiveDevice.desktop;
    }
    if (width > ResponsiveDevice.tablet.minWidth) {
      return ResponsiveDevice.tablet;
    }
    return ResponsiveDevice.mobile;
  }

  bool isDevice(BuildContext context) {
    final device = _getDevice(context);
    return device == this;
  }
}
