import 'package:enset_app/ui/widget/main.drawer.header.widget.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [
          MainDrawerHeader()
        ],
      ),
    );
  }
}

