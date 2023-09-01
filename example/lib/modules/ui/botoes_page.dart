import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';

class BotoesPage extends StatelessWidget {
  const BotoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Botões'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Eleveted")),
            OutlinedButton(onPressed: () {}, child: const Text("outlined")),
            FilledButton(
                onPressed: () {},
                child: Text(
                  "Filled",
                  style: TextStyle(color: context.color.primary),
                )),
            FilledButton.tonal(onPressed: () {}, child: const Text("Tonal")),
            TextButton(onPressed: () {}, child: const Text("TextButton"))
          ],
        ),
      )),
    );
  }
}
