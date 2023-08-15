import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';

class TipografiaPage extends StatelessWidget {
  const TipografiaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipografia'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Display Large", style: context.textTheme.displayLarge),
            Text("Display Medium", style: context.textTheme.displayMedium),
            Text("Display Small", style: context.textTheme.displaySmall),
            Text("Headline Large", style: context.textTheme.headlineLarge),
            Text("Headline Medium", style: context.textTheme.headlineMedium),
            Text("Headline Small", style: context.textTheme.headlineSmall),
            Text("Title Large", style: context.textTheme.titleLarge),
            Text("Title Medium", style: context.textTheme.titleMedium),
            Text("Title Small", style: context.textTheme.titleSmall),
            Text("Label Large", style: context.textTheme.labelLarge),
            Text("Label Medium", style: context.textTheme.labelMedium),
            Text("Label Small", style: context.textTheme.labelSmall),
            Text("Body Large", style: context.textTheme.bodyLarge),
            Text("Body Medium", style: context.textTheme.bodyMedium),
            Text("Body Small", style: context.textTheme.bodySmall),
          ],
        ),
      )),
    );
  }
}
