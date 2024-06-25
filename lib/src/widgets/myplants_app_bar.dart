import 'package:flutter/material.dart';

class MyPlantsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;

  const MyPlantsAppBar({
    this.actions,
    super.key,
  });

  @override
  Size get preferredSize => AppBar().preferredSize;

    @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
          IconButton(
            icon: const Icon(Icons.attach_file),
            onPressed: () {
              // Implement search button logic here
            },
          ),
          IconButton(
            icon: const Icon(Icons.calendar_month),
            onPressed: () {
              // Implement add button logic here
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Implement settings button logic here
            },
          ),
        ],
    );
  }


}