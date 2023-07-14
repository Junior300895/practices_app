import 'package:enset_app/bloc/theme.bloc.dart';
import 'package:enset_app/ui/pages/counter.bloc.page.dart';
import 'package:enset_app/ui/pages/git.users.page.dart';
import 'package:enset_app/ui/pages/home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter.stateful.page.dart';

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          theme: state.themeData,
          routes: {
            "/": (context) => const HomePage(),
            "/counter1": (context) => const CounterStatefulPage(),
            "/counter2": (context) => const CounterBlocPage(),
            "/users": (context) => const GitUsersPage(),
          },
          initialRoute: "/",
        );
      },
    );
  }
}
