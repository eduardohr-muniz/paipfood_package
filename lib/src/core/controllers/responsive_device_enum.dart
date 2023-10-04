import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:universal_io/io.dart';

enum ResponsiveDevice {
  mobile(0),
  tablet(480),
  desktop(1024),
  webPlatform(1024);

  final double minWidth;
  const ResponsiveDevice(this.minWidth);

  bool isPlatform(BuildContext context) {
    final device = _getPlatform();
    return device == this;
  }

  bool isDevice(BuildContext context) {
    final device = _getDevice(context);
    return device == this;
  }

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

  ResponsiveDevice _getPlatform() {
    if (kIsWeb) {
      return ResponsiveDevice.webPlatform;
    } else if (Platform.isAndroid || Platform.isIOS) {
      return ResponsiveDevice.mobile;
    } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      return ResponsiveDevice.desktop;
    }
    return ResponsiveDevice.webPlatform;
  }
}
