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
    const plantTable = '''
    CREATE TABLE plants (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      pid TEXT,
      basic TEXT,
      display_pid TEXT,
      maintenance TEXT,
      parameter TEXT,
      image TEXT
    );
    ''';

    await db.execute(plantTable);
  }

  Future<void> insertPlant(Map<String, dynamic> plant) async {
    final db = await instance.database;
    await db.insert('plants', plant);
  }

  Future<void> close() async {
    final db = await instance.database;
    db.close();
  }
}
