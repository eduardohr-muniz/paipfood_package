import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

//Enum
enum DeviceUtils {
  mobile(0),
  tablet(480),
  desktop(1024),
  webPlatform(-1);

  final double minWidth;
  const DeviceUtils(this.minWidth);

  bool get isPlatform {
    final device = getPlatform();
    return device == this;
  }

  bool _isResponsiveBreakPoint(BuildContext context) {
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

  DeviceUtils getPlatform() {
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

//Provider InheritedWidget
///Add [ResponsiveProvider.builder] in appWidget.
class ResponsiveProvider extends InheritedWidget {
  final DeviceUtils device;
  final Size? size;
  const ResponsiveProvider({
    required this.device,
    required Widget child,
    this.size,
    super.key,
  }) : super(child: child);

  @override
  bool updateShouldNotify(ResponsiveProvider oldWidget) => device != oldWidget.device;

  static Widget builder(BuildContext context, Widget? child) {
    return _BuildListener(child: child ?? Container());
  }

  bool get isMobile => device == DeviceUtils.mobile;
  bool get isTablet => device == DeviceUtils.tablet;
  bool get isDesktop => device == DeviceUtils.desktop;
  double? get h => size?.height;
  double? get w => size?.width;

  static void _modifyDevice(BuildContext context, void Function(DeviceUtils) deviceCallBack) {
    final provider = ResponsiveProvider.of(context);
    DeviceUtils? result;
    if (DeviceUtils.desktop._isResponsiveBreakPoint(context)) result = DeviceUtils.desktop;
    if (DeviceUtils.tablet._isResponsiveBreakPoint(context)) result = DeviceUtils.tablet;
    if (DeviceUtils.mobile._isResponsiveBreakPoint(context)) result = DeviceUtils.mobile;
    if (provider.device != result) {
      debugPrint("--Change responsive to -> ${result?.name}");
      WidgetsBinding.instance.addPostFrameCallback((_) {
        deviceCallBack(result!);
      });
    }
  }

  static void _modifySize(BuildContext context, void Function(Size) sizeCallBack) {
    final provider = ResponsiveProvider.of(context);
    final Size size = MediaQuery.sizeOf(context);
    if (provider.size != size) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        sizeCallBack(size);
      });
    }
  }

  static ResponsiveProvider of(BuildContext context) {
    final testProvider = context.dependOnInheritedWidgetOfExactType<ResponsiveProvider>();
    assert(testProvider != null, "ResponsiveProvider not exist in BuildContext");
    return testProvider!;
  }
}

//Listenner
class _BuildListener extends StatefulWidget {
  final Widget child;
  const _BuildListener({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<_BuildListener> createState() => _BuildListenerState();
}

class _BuildListenerState extends State<_BuildListener> {
  DeviceUtils device = DeviceUtils.desktop;
  Size? size;

  @override
  void initState() {
    super.initState();
  }

  void modifyDevice(BuildContext context) {
    ResponsiveProvider._modifyDevice(context, (newDevice) => setState(() => device = newDevice));
    ResponsiveProvider._modifySize(context, (newSize) => setState(() => size = newSize));
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveProvider(
      device: device,
      size: size,
      child: Builder(builder: (context) {
        modifyDevice(context);
        return widget.child;
      }),
    );
  }
}

//extension

extension ResponsiveProviderContext on BuildContext {
  ResponsiveProvider get responsive => ResponsiveProvider.of(this);
}
