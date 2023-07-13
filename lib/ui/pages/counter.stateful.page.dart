import 'package:flutter/material.dart';

class CounterStatefulPage extends StatefulWidget {
  const CounterStatefulPage({super.key});

  @override
  State<CounterStatefulPage> createState() => _CounterStatefulPageState();
}

class _CounterStatefulPageState extends State<CounterStatefulPage> {
  int counter = 0;
  String errorMessage = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const MainDrawer(), PAS BESOIN
      appBar: AppBar(
        title: const Text("Counter Stateful"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Counter Value => $counter",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          (errorMessage != "") ? Text(errorMessage) : const Text("")
        ]),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "dec",
            onPressed: () {
              setState(() {
                if (counter > 0) {
                  --counter;
                  errorMessage = "";
                } else {
                  errorMessage = "error value < 0";
                }
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
                if (counter < 10) {
                  ++counter;
                  errorMessage = "";
                } else {
                  errorMessage = "error value > 10";
                }
              });
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
