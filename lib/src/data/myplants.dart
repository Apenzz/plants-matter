import 'dart:convert';
import 'plant.dart';
import '../dbhelper/database_helper.dart';

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
    required int wateringPlan,
    required int fertilizingPlan,
    required int pruningPlan,
    required String origin,
    required String production,
    required String category,
    required String blooming,
    required String color,
    required String size,
    required String soil,
    required String sunlight,
    required String watering,
    required String fertilization,
    required String pruning,
  }) {
    var plant = Plant(
      id-1,
      name,
      type,
      imagePath,
      lastWatered,
      wateringPlan,
      fertilizingPlan,
      pruningPlan,
      botanicalName,
      healthStatus,
      origin,
      production,
      category,
      blooming,
      color,
      size,
      soil,
      sunlight,
      watering,
      fertilization,
      pruning,
    );
    myPlants.add(plant);
  }

  Plant getPlant(String id) {
    return myPlants[int.parse(id)];
  }

 

  Future<void> addOwnedPlant(String plantPid) async {
    final dbHelper = DatabaseHelper.instance;
    await dbHelper.insertOwnedPlant(plantPid);
    final plantRecords = await dbHelper.queryAllPlants();

    final plant = plantRecords.firstWhere((record) => record['pid'] == plantPid);
    var basic = json.decode(plant['basic']);
    var maintenance = json.decode(plant['maintenance']);

    addPlant(
      id: plant['id'],
      name: plant['pid'],
      type: basic['category'],
      imagePath: plant['image'],
      lastWatered: DateTime.now(),
      botanicalName: basic['category'],
      healthStatus: 'undiagnosed',
      wateringPlan: 7,
      fertilizingPlan: 14,
      pruningPlan: 30,
      origin: basic['origin'],
      production: basic['production'],
      category: basic['category'],
      blooming: basic['blooming'],
      color: basic['color'],
      size: maintenance['size'],
      soil: maintenance['soil'],
      sunlight: maintenance['sunlight'],
      watering: maintenance['watering'],
      fertilization: maintenance['fertilization'],
      pruning: maintenance['pruning'],
    );
  }
}

var myPlantsInstance = MyPlants();
