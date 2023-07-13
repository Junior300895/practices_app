import 'package:flutter/material.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const MainDrawer(), PAS BESOIN
      appBar: AppBar(
        title: const Text("Counter Bloc"),
      ),
      body: Center(
        child: Text(
          "Counter bloc",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
