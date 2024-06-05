import 'package:flutter/material.dart';

class BasicPlantCard extends StatelessWidget {

  final String name;
  final String imagePath;

  const BasicPlantCard({super.key, required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          ),
        ),
      );
  }
}