// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import '../data/plant.dart';
import '../widgets/tab_plant_tasks.dart';
import '../widgets/add_plant_button.dart';
import '../data/myplants.dart';
import '../widgets/basic_plant_card.dart';

class HomePageScreen extends StatelessWidget {
  final String title;
  final ValueChanged<Plant> onTap;

  const HomePageScreen({
    required this.onTap,
    this.title = 'Plants matter',
    super.key,
  });

  void _completeTask(BuildContext context, Plant plant) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Task completed!")),
    );
    // TODO
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          bottom: const TabPlantTasks(),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: myPlantsInstance.myPlants.length,
              itemBuilder: (context, index) {
                final plant = myPlantsInstance.myPlants[index];
                return BasicPlantCard(
                  name: plant.name,
                  imagePath: plant.imagePath,
                  onComplete: () => _completeTask(context, plant),
                );
              },
            ),
            ListView.builder(
              itemCount: myPlantsInstance.myPlants.length,
              itemBuilder: (context, index) {
                final plant = myPlantsInstance.myPlants[index];
                return BasicPlantCard(
                  name: plant.name,
                  imagePath: plant.imagePath,
                  onComplete: () => _completeTask(context, plant),
                );
              },
            ),
          ]
        )
      ),
    );
  }
}