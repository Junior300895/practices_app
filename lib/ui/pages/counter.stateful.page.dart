import 'package:enset_app/ui/widget/main.drawer.widget.dart';
import 'package:flutter/material.dart';

class CounterStatefulPage extends StatelessWidget {
  const CounterStatefulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text("Counter Stateful"),
      ),
      body: Center(
        child: Text(
          "Counter stateful",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
