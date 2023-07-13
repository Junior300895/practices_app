import 'package:enset_app/ui/widget/drawer.item.widget.dart';
import 'package:enset_app/ui/widget/main.drawer.header.widget.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> menus = [
      {
        "title": "Home",
        "route": "/",
        "leadindIcon": Icons.home,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Counter Stful",
        "route": "/",
        "leadindIcon": Icons.event,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Counter Bloc",
        "route": "/",
        "leadindIcon": Icons.timer,
        "trailingIcon": Icons.arrow_forward
      },
      {
        "title": "Git users",
        "route": "/",
        "leadindIcon": Icons.person,
        "trailingIcon": Icons.arrow_forward
      },
    ];

    return Drawer(
      child: Column(
        children: [
          const MainDrawerHeader(),
          Expanded(
            child: ListView(
              children: [
                DrawerItem(
                  title: "HOME",
                  leadingIcon: Icons.home,
                  trailingIcon: Icons.arrow_forward,
                  onAction: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/");
                  },
                ),
                DrawerItem(
                  title: "Counter Stateful",
                  leadingIcon: Icons.home,
                  trailingIcon: Icons.arrow_forward,
                  onAction: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/counter1");
                  },
                ),
                DrawerItem(
                  title: "Counter Bloc",
                  leadingIcon: Icons.home,
                  trailingIcon: Icons.arrow_forward,
                  onAction: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/counter2");
                  },
                ),
                DrawerItem(
                  title: "Git Users",
                  leadingIcon: Icons.home,
                  trailingIcon: Icons.arrow_forward,
                  onAction: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/users");
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
