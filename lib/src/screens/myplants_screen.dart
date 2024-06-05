import 'package:flutter/material.dart';
import '../data/plant.dart';
import '../data/myplants.dart';
import '../widgets/myplants_list.dart';
import '../widgets/add_plant_button.dart';
import '../widgets/myplants_app_bar.dart';

class MyPlantsScreen extends StatelessWidget {
  final String title;
  final ValueChanged<Plant> onTap;

  const MyPlantsScreen({
    required this.onTap,
    this.title = 'Plants',
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const MyPlantsAppBar(),
        
        body: MyPlantsList(
          plants: myPlantsInstance.myPlants,
          onTap: onTap,
        ),
        floatingActionButton: const AddPlantButton(),
      );
}
