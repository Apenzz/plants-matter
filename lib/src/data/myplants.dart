import 'plant.dart';

class MyPlants {
  final List<Plant> myPlants = [];

  void addPlant({
    required int id,
    required String name,
    required String type,
    required String imagePath,
    required DateTime lastWatered,
    required String botanicalName,
    required String healthStatus,
    //expressed in number of days
    required int wateringPlan,
    required int fertilizingPlan,
    required int pruningPlan
  }) {
    var plant = Plant(id, name, type, imagePath, lastWatered, wateringPlan, fertilizingPlan, pruningPlan, botanicalName, healthStatus);
    myPlants.add(plant);
  }
  Plant getPlant(String id) {
    return myPlants[int.parse(id)];
  }
}

final myPlantsInstance = MyPlants()
  ..addPlant(
      id: 0,
      name: 'Vine Maple',
      type: 'Bonsai',
      botanicalName: 'Acer circinatum',
      imagePath: 'assets/images/vinemaple.jpg',
      lastWatered: DateTime.now(),
      wateringPlan: 7,
      fertilizingPlan: 14,
      pruningPlan: 30,
      healthStatus: 'undiagnosed'
  )
  ..addPlant(
      id: 1,
      name: 'Cactus',
      type: 'Caryophyllales',
      botanicalName: 'Cactaceae',
      imagePath: 'assets/images/cactus.jpg',
      lastWatered: DateTime.now(),
      wateringPlan: 7,
      fertilizingPlan: 14,
      pruningPlan: 30,
      healthStatus: 'undiagnosed'
  )
  ..addPlant(
      id: 2,
      name: 'Rose',
      type: 'Perennial shrub',
      botanicalName: 'Rosaceae',
      imagePath: 'assets/images/rose.jpg',
      lastWatered: DateTime.now(),
      wateringPlan: 7,
      fertilizingPlan: 14,
      pruningPlan: 30,
      healthStatus: 'undiagnosed'
  );

  