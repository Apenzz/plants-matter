import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('plants.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final dbPath = join(documentsDirectory.path, filePath);

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE plants (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      pid TEXT,
      basic TEXT,
      display_pid TEXT,
      maintenance TEXT,
      parameter TEXT,
      image TEXT
    );
    ''');

    await db.execute('''
    CREATE TABLE owned_plants (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      plant_pid TEXT,
      wateringPlan INTEGER,
      fertilizingPlan INTEGER,
      pruningPlan INTEGER,
      lastWatered INTEGER,
      FOREIGN KEY (plant_pid) REFERENCES plants (pid)
    );
    ''');
  }

  Future<String?> getImageByPid(String pid) async {
  final db = await instance.database;
  var result = await db.query(
    'plants',
    columns: ['image'],
    where: 'pid = ?',
    whereArgs: [pid],
    limit: 1,
  );

  if (result.isNotEmpty) {
    return result[0]['image'] as String;
  } else {
    return null; // Return null if no plant with the given pid is found
  }
}

  Future<void> insertPlant(Map<String, dynamic> plant) async {
    final db = await instance.database;
    await db.insert('plants', plant);
  }

  Future<void> insertOwnedPlant(String plantPid) async {
    final db = await instance.database;
    await db.insert('owned_plants', {'plant_pid': plantPid});
  }

  Future<List<Map<String, dynamic>>> queryAllPlants() async {
    final db = await instance.database;
    return await db.query('plants');
  }

  Future<List<String>> queryOwnedPlantPids() async {
    final db = await instance.database;
    final results = await db.query('owned_plants', columns: ['plant_pid']);
    return results.map((row) => row['plant_pid'] as String).toList();
  }

Future<Map<String, dynamic>?> queryOwnedPlantByPid(String pid) async {
  final db = await instance.database;
  final results = await db.query(
    'owned_plants',
    where: 'plant_pid = ?',
    whereArgs: [pid],
  );

  if (results.isNotEmpty) {
    var plantRecord = results.first;
    
   
    Map<String, dynamic> mutablePlantRecord = Map.from(plantRecord);

    // Convert 'lastWatered' to DateTime if not null
    if (mutablePlantRecord['lastWatered'] != null) {
      mutablePlantRecord['lastWatered'] = DateTime.fromMillisecondsSinceEpoch(mutablePlantRecord['lastWatered'] as int);
    }
    
    return mutablePlantRecord;
  } else {
    return null;
  }
}




  Future<int> updateWateringPlan(Map<String, dynamic> plantRecord, int newWateringPlan) async {
    final db = await instance.database;
    plantRecord['wateringPlan'] = newWateringPlan;
    return await db.update(
      'owned_plants',
      plantRecord,
      where: 'plant_pid = ?',
      whereArgs: [plantRecord['plant_pid']],
    );
  }

  
  Future<int> updateFertilizingPlan(Map<String, dynamic> plantRecord, int newFertilizingPlan) async {
    final db = await instance.database;
    plantRecord['fertilizingPlan'] = newFertilizingPlan;
    return await db.update(
      'owned_plants',
      plantRecord,
      where: 'plant_pid = ?',
      whereArgs: [plantRecord['plant_pid']],
    );
  }

  Future<int> updatePruningPlan(Map<String, dynamic> plantRecord, int newPruningPlan) async {
    final db = await instance.database;
    plantRecord['pruningPlan'] = newPruningPlan;
    return await db.update(
      'owned_plants',
      plantRecord,
      where: 'plant_pid = ?',
      whereArgs: [plantRecord['plant_pid']],
    );
  }

 Future<int> updateLastWatered(Map<String, dynamic> plantRecord, DateTime lastWatered) async {
  final db = await instance.database;

  
  final Map<String, dynamic> updatedPlantRecord = Map<String, dynamic>.from(plantRecord);

  
  updatedPlantRecord['lastWatered'] = lastWatered.millisecondsSinceEpoch; // Convert DateTime to Unix timestamp

  
  return await db.update(
    'owned_plants',
    updatedPlantRecord,
    where: 'plant_pid = ?',
    whereArgs: [updatedPlantRecord['plant_pid']],
  );
}

  
  Future<void> close() async {
    final db = await instance.database;
    db.close();
  }
}
