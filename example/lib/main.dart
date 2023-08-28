import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';

import 'modules/presenter/teste_page.dart';
import 'modules/ui/botoes_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemesExtension.darkTheme,
      themeMode: ThemeMode.light,
      darkTheme: ThemesExtension.darkTheme,
      routes: {
        "/": (context) => const BotoesPage(),
        "/teste/": (context) => const TestePage(),
      },
      initialRoute: "/teste/",
    );
  }
}
