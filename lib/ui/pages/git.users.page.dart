import 'package:flutter/material.dart';

class GitUsersPage extends StatelessWidget {
  const GitUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const MainDrawer(), PAS BESOIN 
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
