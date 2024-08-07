import 'package:flutter/material.dart';
import '../data.dart';
import '../widgets/plantprofile_sections.dart';

class PlantProfileScreen extends StatelessWidget {
  final Plant? plant;

  const PlantProfileScreen({
    super.key,
    this.plant,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plant!.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Image Banner
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(plant!.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Plant Info Section
            PlantSection(
              title: 'Plant Info',
              content: [
                'Plant category: ${plant!.category}',
                'Origin: ${plant!.origin}',
              ],
              buttonText: 'Additional infos',
              plant: plant!,
            ),
            Divider(thickness: 2.0),
            // Care Plan Section
            PlantSection(
              title: 'Care Plan',
              content: [
                'Watering every ${plant!.wateringPlan} days',
                'Fertilizing every ${plant!.fertilizingPlan} days',
                'Pruning every ${plant!.pruningPlan} days',
              ],
              buttonText: 'Change plan',
              plant: plant!,
            ),
            Divider(thickness: 2.0),
            // Health Status Section
            PlantSection(
              title: 'Health Status',
              content: [
                'Health status: ${plant!.healthStatus}',
              ],
              buttonText: 'Diagnose',
              plant: plant!,
            ),
          ],
        ),
      ),
    );
  }
}
