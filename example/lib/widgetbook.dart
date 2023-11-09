// widgetbook.dart

import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
// Import the generated directories variable
import 'widgetbook.directories.g.dart';

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("------------------------");
    print(Env.supaApiKey);
    return Widgetbook.material(
      directories: directories,
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: ThemeCustom.lightTheme),
            WidgetbookTheme(name: 'Dark', data: ThemeCustom.darkTheme),
          ],
        ),
        TextScaleAddon(
          scales: [1.0, 2.0],
        ),
        LocalizationAddon(
          locales: [
            const Locale('en'),
            const Locale('pt_BR'),
            const Locale('pt'),
          ],
          localizationsDelegates: [
            DefaultWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
          ],
        ),
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhoneSE,
            Devices.ios.iPhone13,
            Devices.android.samsungGalaxyA50,
            Devices.android.smallTablet,
            Devices.android.mediumTablet,
            Devices.android.largeTablet,
            Devices.macOS.macBookPro,
            Devices.macOS.wideMonitor,
          ],
        ),
        BuilderAddon(
          name: "responsive",
          builder: (context, child) {
            return ResponsiveProvider.builder(
              context,
              ToastProvider.builder(context, child),
            );
          },
        )
      ],
    );
  }
}
