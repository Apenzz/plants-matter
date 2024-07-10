
import 'package:flutter/material.dart';
import '../widgets/careplan_settings_list.dart';
import '../data.dart';


class CarePlanSettingsScreen extends StatelessWidget {
  final Plant plant;

  const CarePlanSettingsScreen({
    super.key,
    required this.plant,
  });

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Care Plan Settings'),
      ),
      body: CarePlanSettingsList(
        plant: plant,
      )

    );
  }
}