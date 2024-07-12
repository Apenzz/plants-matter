
import 'package:flutter/material.dart';
import '../data/plant.dart';
import '../widgets/tab_plant_tasks.dart';
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
    
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: TabPlantTasks(),
        ),
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
              itemCount: 0,
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