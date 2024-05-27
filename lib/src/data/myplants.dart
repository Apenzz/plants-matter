import 'plant.dart';

class MyPlants {
  final List<Plant> myPlants = [];
  void addPlant({
    required int id,
    required String name,
    required String type,
  }) {
    var plant = Plant(id, name, type);
    myPlants.add(plant);
  }
}  

final myPlantsInstance = MyPlants()
  ..addPlant(
      id: 1,
      name: 'Vine Mape',
      type: 'Bonsai'
      )
  ..addPlant(
      id: 2,
      name: 'Cactus',
      type: 'Cactaceae')
  ..addPlant(
      id: 3,
      name: 'Rose',
      type: 'Rosaceae');
