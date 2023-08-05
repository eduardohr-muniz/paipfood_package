import 'package:example/modules/presenter/cw_toast.dart';
import 'package:example/modules/presenter/overlay_test.dart';
import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'package:toastification/toastification.dart';

class TestePage extends StatefulWidget {
  const TestePage({super.key});

  @override
  State<TestePage> createState() => _TestePageState();
}

class _TestePageState extends State<TestePage> {
  final inputEC = TextEditingController();
  final testeUpdate = ValueNotifier(false);
  final toastification = Toastification();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Teste')),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Text("Text Fild", style: context.textTheme.displayLarge),
              CwTextFormFild(
                updateInitialValueVN: testeUpdate,
                initialValue: "abcde",
                controller: inputEC,
                label: "Teste",
                expanded: true,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      CwOverlay.hide();
                    });
                  },
                  child: Text("change")),
              TextButton(onPressed: () {}, child: Text("change")),
              // CwSearchFild(menuController: menuController, label: label, children: children, list: list, controller: controller)
            ],
          ),
        ),
      ),
    );
  }
}
