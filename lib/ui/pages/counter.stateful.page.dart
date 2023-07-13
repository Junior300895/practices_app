import 'package:flutter/material.dart';

class CounterStatefulPage extends StatefulWidget {
  const CounterStatefulPage({super.key});

  @override
  State<CounterStatefulPage> createState() => _CounterStatefulPageState();
}

class _CounterStatefulPageState extends State<CounterStatefulPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const MainDrawer(), PAS BESOIN
      appBar: AppBar(
        title: const Text("Counter Stateful"),
      ),
      body: Center(
        child: Text(
          "Counter Value => $counter",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "dec",
            onPressed: () {
              setState(() {
                --counter;
              });
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: "inc",
            onPressed: () {
              setState(() {
                ++counter;
              });
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
