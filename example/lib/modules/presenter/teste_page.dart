import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';

class TestePage extends StatelessWidget {
  const TestePage({super.key});

  @override
  Widget build(BuildContext context) {
    final inputEC = TextEditingController();
    final searchEC = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Teste')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Text("Text Fild"),
            CwTextFormFild(controller: inputEC, label: "Teste", expanded: true),
            CwSizedBox(),
            // CwSearchFild(menuController: menuController, label: label, children: children, list: list, controller: controller)
          ],
        ),
      ),
    );
  }
}
