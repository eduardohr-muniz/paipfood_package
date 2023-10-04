import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:universal_io/io.dart';

enum DeviceUtils {
  mobile(0),
  tablet(480),
  desktop(1024),
  webPlatform(1024);

  final double minWidth;
  const DeviceUtils(this.minWidth);

  bool isPlatform() {
    final device = _getPlatform();
    return device == this;
  }

  bool isResponsiveBreakPoint(BuildContext context) {
    final device = _getDevice(context);
    return device == this;
  }

  DeviceUtils _getDevice(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width > DeviceUtils.desktop.minWidth) {
      return DeviceUtils.desktop;
    }
    if (width > DeviceUtils.tablet.minWidth) {
      return DeviceUtils.tablet;
    }
    return DeviceUtils.mobile;
  }

  DeviceUtils _getPlatform() {
    if (kIsWeb) {
      return DeviceUtils.webPlatform;
    } else if (Platform.isAndroid || Platform.isIOS) {
      return DeviceUtils.mobile;
    } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      return DeviceUtils.desktop;
    }
    return DeviceUtils.webPlatform;
  }
}
