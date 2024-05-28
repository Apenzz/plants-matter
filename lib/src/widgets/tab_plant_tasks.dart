import 'package:flutter/material.dart';

class TabPlantTasks extends StatelessWidget implements PreferredSizeWidget {
  const TabPlantTasks({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      tabs: <Widget>[
        Tab(text: "Today"),
        Tab(text: "Incoming"),
      ]
    );
  }
}