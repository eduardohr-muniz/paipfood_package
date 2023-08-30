import 'package:flutter/material.dart';

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
                child: const Text(
                  "Filled",
                  style: TextStyle(color: Colors.black),
                )),
            FilledButton.tonal(onPressed: () {}, child: const Text("Tonal")),
            TextButton(onPressed: () {}, child: const Text("TextButton"))
          ],
        ),
      )),
    );
  }
}
