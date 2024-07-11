import 'package:flutter/material.dart';
import '../data.dart';
import '../widgets/plantinfos_sections.dart';

class PlantInfosScreen extends StatelessWidget {
  final Plant? plant;

  const PlantInfosScreen({
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
            InfoSection(
              title: 'Characteristics',
              content: [
                'Origin: ${plant!.origin}',
                'Production: ${plant!.production}',
                'Category: ${plant!.category}',
                'Blooming: ${plant!.blooming}',
                'Color: ${plant!.color}',
              ],
            ),
            Divider(thickness: 2.0),
            // Care Plan Section
            InfoSection(
              title: 'Maintenance Tips',
              content: [
                'Soil: ${plant!.soil}',
                'Sunlight: ${plant!.sunlight}',
                'Watering: ${plant!.watering}',
                'Fertilization: ${plant!.fertilization}',
                'Pruning: ${plant!.pruning}',
              ],
            ),
            Divider(thickness: 2.0),
          ],
        ),
      ),
    );
  }
}
