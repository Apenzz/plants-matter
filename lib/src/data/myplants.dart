import 'plant.dart';

class MyPlants {
  final List<Plant> myPlants = [];

  void addPlant({
    required int id,
    required String name,
    required String type,
    required String imagePath,
    required DateTime lastWatered,
  }) {
    var plant = Plant(id, name, type, imagePath, lastWatered);
    myPlants.add(plant);
  }
}

final myPlantsInstance = MyPlants()
  ..addPlant(
      id: 1,
      name: 'Vine Maple',
      type: 'Bonsai',
      imagePath: 'assets/images/bonsai-vine-maple.jpg',
      lastWatered: DateTime.now(),
  )
  ..addPlant(
      id: 2,
      name: 'Cactus',
      type: 'Cactaceae',
      imagePath: 'assets/images/cactus.jpg',
      lastWatered: DateTime.now(),
  )
  ..addPlant(
      id: 3,
      name: 'Rose',
      type: 'Rosaceae',
      imagePath: 'assets/images/rose.jpg',
      lastWatered: DateTime.now(),
  );