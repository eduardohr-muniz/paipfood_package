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
            ElevatedButton(onPressed: () {}, child: Text("Eleveted")),
            OutlinedButton(onPressed: () {}, child: Text("outlined")),
            FilledButton(
                onPressed: () {},
                child: Text(
                  "Filled",
                  style: TextStyle(color: Colors.black),
                )),
            FilledButton.tonal(onPressed: () {}, child: Text("Tonal")),
            TextButton(onPressed: () {}, child: Text("TextButton"))
          ],
        ),
      )),
    );
  }
}
