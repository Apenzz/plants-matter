import 'package:flutter/material.dart';
import 'src/load_json_to_db.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadDatabase();
  runApp(const Plantsmatter());
}



