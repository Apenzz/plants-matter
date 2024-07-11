import 'dart:convert';
import 'package:flutter/services.dart';
import 'dbhelper/database_helper.dart';

Future<void> loadDatabase() async {
  try {
    final dbHelper = DatabaseHelper.instance;

    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final jsonFiles = manifestMap.keys
        .where((String key) => key.contains('lib/src/data/json/'))
        .toList();

    for (String path in jsonFiles) {
      final String jsonString = await rootBundle.loadString(path);
      final Map<String, dynamic> jsonData = json.decode(jsonString);

      final plant = {
        'pid': jsonData['pid'],
        'basic': json.encode(jsonData['basic']),
        'display_pid': jsonData['display_pid'],
        'maintenance': json.encode(jsonData['maintenance']),
        'parameter': json.encode(jsonData['parameter']),
        'image': jsonData['image'],
      };

      await dbHelper.insertPlant(plant);
    }
  } catch (e) {
    print('Error loading JSON files: $e');
  }
}
