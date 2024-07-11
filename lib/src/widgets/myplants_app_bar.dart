import 'package:flutter/material.dart';

class MyPlantsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyPlantsAppBar({super.key});

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('My Plants'),
      centerTitle: true,
    );
  }
}
