import 'package:flutter/material.dart';
import '../data/plant.dart';

class MyPlantsList extends StatelessWidget {
  final List<Plant> plants;
  final ValueChanged<Plant>? onTap;

   const MyPlantsList({
    required this.plants,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: plants.length,
      itemBuilder: (context, index) {
        final plant = plants[index];
        final lastWatered = plant.lastWatered;
        final difference = DateTime.now().difference(lastWatered);
        String wateredText;

        if (difference.inDays == 0) {
          wateredText = 'Today';
        } else {
          wateredText = '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
        }

        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(plant.imagePath),
          ),
          title: Text(plant.name),
          subtitle: Text('Last watered: $wateredText'),
          onTap: onTap != null ? () => onTap!(plant) : null,
        );
      },
    );
  }
}