import 'package:enset_app/ui/pages/counter.bloc.page.dart';
import 'package:enset_app/ui/pages/counter.stateful.page.dart';
import 'package:enset_app/ui/pages/git.users.page.dart';
import 'package:enset_app/ui/pages/home.page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const RootView();
  }
}

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: {
        "/": (context) => const HomePage(),
        "/counter1": (context) => const CounterStatefulPage(),
        "/counter2": (context) => const CounterBlocPage(),
        "/users": (context) => const GitUsersPage(),
      },
      initialRoute: "/",
    );
  }
}
