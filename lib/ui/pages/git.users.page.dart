import 'package:enset_app/ui/widget/main.drawer.widget.dart';
import 'package:flutter/material.dart';

class GitUsersPage extends StatelessWidget {
  const GitUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text("Git Users"),
      ),
      body: Center(
        child: Text(
          "Git users",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
