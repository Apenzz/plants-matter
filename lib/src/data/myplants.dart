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
  }) {
    var plant = Plant(
      id,
      name,
      type,
      imagePath,
      lastWatered,
      wateringPlan,
      fertilizingPlan,
      pruningPlan,
      botanicalName,
      healthStatus,
    );
    myPlants.add(plant);
  }

  Plant getPlant(String id) {
    return myPlants[int.parse(id)];
  }

  Future<void> loadPlantsFromDatabase() async {
    final dbHelper = DatabaseHelper.instance;
    final plantRecords = await dbHelper.queryAllPlants();

    for (var record in plantRecords) {
      addPlant(
        id: record['id'],
        name: record['pid'], // or another field from your JSON data
        type: 'Unknown', // or another field if you have it in your JSON
        imagePath: record['image'],
        lastWatered: DateTime.now(), // adjust this if you have a lastWatered field
        botanicalName: 'Unknown', // or another field if you have it in your JSON
        healthStatus: 'undiagnosed',
        wateringPlan: 7, // default or derived from your data
        fertilizingPlan: 14, // default or derived from your data
        pruningPlan: 30, // default or derived from your data
      );
    }
  }
}

final myPlantsInstance = MyPlants();
