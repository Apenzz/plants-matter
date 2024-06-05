// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import '../data.dart';

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
                  image: AssetImage(plant!.imagePath), // Path to your local image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Plant Info Section
            _buildSection(
              context,
              'Plant Info',
              [
                'Plant type: ${plant!.type}',
                'Botanical name: ${plant!.botanicalName}',
                'Common name: ${plant!.name}',
              ],
              'Additional infos',
            ),
            // Separator
            Divider(thickness: 2.0),
            // Care Plan Section
            _buildSection(
              context,
              'Care Plan',
              [
                'Watering every ${plant!.wateringPlan} days',
                'Fertilizing every ${plant!.fertilizingPlan} days',
                'Pruning every ${plant!.pruningPlan} days',
              ],
              'Change plan',
            ),
            // Separator
            Divider(thickness: 2.0),
            // Health Status Section
            _buildSection(
              context,
              'Health Status',
              [
                'Health status: ${plant!.healthStatus}',
              ],
              'Diagnose',
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildSection(BuildContext context, String title, List<String> content, String buttonText) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.headlineSmall),
                  SizedBox(height: 8),
                  ...content.map((item) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('• ', style: Theme.of(context).textTheme.bodyMedium),
                      Expanded(
                        child: Text(
                          item,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  )).toList(),
                ],
              ),
            ),
            Container(
              height: 48, // Adjust height here
              width: 120, // Adjust width here
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, // Remove any default padding
                  foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer, // Text color
                  backgroundColor: Theme.of(context).colorScheme.secondaryContainer, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  // Handle button press
                },
                child: buttonText == 'Diagnose' ? 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt_outlined), // Camera icon
                      SizedBox(width: 4), // Add some spacing
                      Text(
                        buttonText,
                        maxLines: 1, // Ensure text appears on one line
                        overflow: TextOverflow.ellipsis, // Handle text overflow with ellipsis
                      ),
                    ],
                  ) :
                  Text(
                    buttonText,
                    maxLines: 1, // Ensure text appears on one line
                    overflow: TextOverflow.ellipsis, // Handle text overflow with ellipsis
                  ),
              ),
            ),
          ],
        ),
        if (title == 'Health Status') Divider(thickness: 2.0), // Add divider after the third section
      ],
    ),
  );
}


  
}
