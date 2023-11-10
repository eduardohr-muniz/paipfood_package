import 'package:flutter/services.dart';

class ScreenConfig {
  ScreenConfig._();
  static void setColorAppBar({required Color statusBarColor, Brightness? statusBarBrightness}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
      statusBarBrightness: statusBarBrightness,
      statusBarIconBrightness: statusBarBrightness,
    ));
  }

  static void setFullScreenDragBack() => SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

  static void setFullScreen() => SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  static void popFullScreen() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
    );
  }

  static void customFullScreen({List<SystemUiOverlay>? overlays = const [SystemUiOverlay.bottom]}) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
    );
  }

  static void setOrientation(DeviceOrientation deviceOrientation) {
    SystemChrome.setPreferredOrientations([deviceOrientation]);
  }
}
