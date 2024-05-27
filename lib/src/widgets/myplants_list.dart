import 'package:flutter/material.dart';

import '../data.dart';

class MyPlantsList extends StatelessWidget {
  final List<Plant> plants;
  final ValueChanged<Plant>? onTap;

  const MyPlantsList({
    required this.plants,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: plants.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            plants[index].name,
          ),
          subtitle: Text(
            plants[index].type,
          ),
          onTap: onTap != null ? () => onTap!(plants[index]) : null,
        ),
      );
}
