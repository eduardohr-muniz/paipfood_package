import 'package:flutter/material.dart';

const defaultValue = 56.0;

class CwOverlay extends StatelessWidget {
  static OverlayEntry? _currentOverlay;

  const CwOverlay._(this.widget);

  final Widget? widget;
  static WidgetsBinding? widgetBind = WidgetsBinding.instance;

  static OverlayState? _overlayState;

  static bool get isShown => _currentOverlay != null;

  /// If you need to show an normal overlayloader,
  /// just call ```Loader.show(context)``` with a build context.
  /// BuildContext is a required param.
  ///
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        debugPrint("called will pop <><><");

        return false;
      },
      child: const SizedBox.shrink(),
    );
  }

  static void show(
    BuildContext context, {
    Widget? child,
    Color? overlayColor,
    double? overlayFromTop,
    double? overlayFromBottom,
    bool isAppbarOverlay = true,
    bool isBottomBarOverlay = true,
    bool isMinSize = true,
  }) {
    var safeBottomPadding = MediaQuery.of(context).padding.bottom;
    var defaultPaddingTop = 0.0;
    var defaultPaddingBottom = 0.0;
    if (!isAppbarOverlay) {
      isMinSize = false;
    }
    if (!isMinSize) {
      defaultPaddingTop = defaultValue;
      defaultPaddingBottom = defaultValue + safeBottomPadding;
    } else {
      defaultPaddingTop = defaultValue;
      defaultPaddingBottom = defaultValue;
    }

    _overlayState = Overlay.of(context);
    if (_currentOverlay == null) {
      ///Create current Loader Entry
      _currentOverlay = OverlayEntry(builder: (context) {
        return Stack(
          children: [
            isMinSize
                ? const SizedBox.shrink()
                : _overlayWidget(isMinSize, overlayColor ?? const Color(0x99ffffff), isAppbarOverlay ? 0.0 : overlayFromTop ?? defaultPaddingTop,
                    isBottomBarOverlay ? 0.0 : overlayFromBottom ?? defaultPaddingBottom),
            Center(child: child ?? const SizedBox.shrink()),
          ],
        );
      });

      try {
        widgetBind?.addPostFrameCallback((_) {
          if (_currentOverlay != null) {
            _overlayState?.insert(_currentOverlay!);
          }
        });
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  static Widget _overlayWidget(bool isSafeArea, Color overlayColor, double overlayFromTop, double overlayFromBottom) {
    return isSafeArea
        ? Container(
            color: overlayColor,
            margin: EdgeInsets.only(top: overlayFromTop, bottom: overlayFromBottom),
          )
        : SafeArea(
            child: Container(
            color: overlayColor,
            margin: EdgeInsets.only(top: overlayFromTop, bottom: overlayFromBottom),
          ));
  }

  static void hide() {
    if (_currentOverlay != null) {
      try {
        _currentOverlay?.remove();
      } catch (e) {
        debugPrint(e.toString());
      } finally {
        _currentOverlay = null;
      }
    }
  }
}
