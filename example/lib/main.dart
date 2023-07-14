import 'package:example/modules/presenter/teste_page.dart';
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
      theme: CustomThemeExtension.lightTheme,
      darkTheme: CustomThemeExtension.lightTheme,
      home: const TestePage(),
    );
  }
}
