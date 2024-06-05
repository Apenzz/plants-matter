import 'package:flutter/material.dart';

class MyPlantsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBack;
  final List<Widget>? actions;

  const MyPlantsAppBar({
    this.onBack,
    this.actions,
    super.key,
  });

  @override
  Size get preferredSize => AppBar().preferredSize;

    @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("My plants"),
      leading: onBack != null
          ? IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: onBack,
            )
          : null,
      actions: [
          IconButton(
            icon: Icon(Icons.attach_file),
            onPressed: () {
              // Implement search button logic here
            },
          ),
          IconButton(
            icon: Icon(Icons.calendar_month),
            onPressed: () {
              // Implement add button logic here
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Implement settings button logic here
            },
          ),
        ],
    );
  }


}