import 'package:flutter/material.dart';
import 'src/load_json_to_db.dart';
import 'src/app.dart';
import 'src/data/myplants.dart'; // import MyPlants

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadDatabase();
  await myPlantsInstance.loadOwnedPlantsFromDatabase(); // Load all plants as owned plants from database
  runApp(const Plantsmatter());
}
