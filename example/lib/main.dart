import 'package:example/modules/presenter/teste_page.dart';
import 'package:example/modules/ui/botoes_page.dart';
import 'package:example/modules/ui/tipografia_page.dart';
import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomThemeExtension.darkTheme,
      themeMode: ThemeMode.light,
      darkTheme: CustomThemeExtension.darkTheme,
      routes: {"/": (context) => const BotoesPage()},
      initialRoute: "/",
    );
  }
}
