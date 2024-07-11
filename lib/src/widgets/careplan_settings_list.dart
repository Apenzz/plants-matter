import 'package:flutter/material.dart';
import '../widgets/frequencypicker.dart';
import '../dbhelper/database_helper.dart';
import '../data.dart';

class CarePlanSettingsList extends StatefulWidget {
  final Plant plant;

  const CarePlanSettingsList({
    Key? key,
    required this.plant,
  }) : super(key: key);

  @override
  _CarePlanSettingsListState createState() => _CarePlanSettingsListState();
}

class _CarePlanSettingsListState extends State<CarePlanSettingsList> {
  void _updateWateringPlan(String frequency) async {
  setState(() {
    widget.plant.wateringPlan = _parseFrequency(frequency);
    widget.plant.setWateringPlan(_parseFrequency(frequency));
  });

  final dbHelper = DatabaseHelper.instance;

  try {
    final plant = await dbHelper.queryOwnedPlantByPid(widget.plant.name);
    if (plant != null) {
      dbHelper.updateWateringPlan(plant, _parseFrequency(frequency));
    } else {
      print('Plant not found');
    }
  } catch (error) {
    print('Error querying plant: $error');
  }
}


  void _updateFertilizingPlan(String frequency) async {
  setState(() {
    widget.plant.fertilizingPlan = _parseFrequency(frequency);
    widget.plant.setFertilizingPlan(_parseFrequency(frequency));
  });

  final dbHelper = DatabaseHelper.instance;

  try {
    final plant = await dbHelper.queryOwnedPlantByPid(widget.plant.name);
    if (plant != null) {
      dbHelper.updateFertilizingPlan(plant, _parseFrequency(frequency));
    } else {
      print('Plant not found');
    }
  } catch (error) {
    print('Error querying plant: $error');
  }
}


  void _updatePruningPlan(String frequency) async {
  setState(() {
    widget.plant.pruningPlan = _parseFrequency(frequency);
    widget.plant.setPruningPlan(_parseFrequency(frequency));
  });

  final dbHelper = DatabaseHelper.instance;

  try {
    final plant = await dbHelper.queryOwnedPlantByPid(widget.plant.name);
    if (plant != null) {
      dbHelper.updatePruningPlan(plant, _parseFrequency(frequency));
    } else {
      print('Plant not found');
    }
  } catch (error) {
    print('Error querying plant: $error');
  }
}


  int _parseFrequency(String frequency) {
    List<String> parts = frequency.split(' ');
    int value = int.parse(parts[0]);
    String unit = parts[1];

    switch (unit) {
      case 'Days':
        return value;
      case 'Weeks':
        return value * 7;
      case 'Months':
        return value * 30;
      default:
        return value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 3, // Number of items in the list
        itemBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CarePlanItem(
                isFirst: true,
                icon: Icons.water_drop_outlined,
                name: 'Watering',
                days: widget.plant.wateringPlan,
                onFrequencyChanged: _updateWateringPlan,
              );
            case 1:
              return CarePlanItem(
                icon: Icons.compost,
                name: 'Fertilizing',
                days: widget.plant.fertilizingPlan,
                onFrequencyChanged: _updateFertilizingPlan,
              );
            case 2:
              return CarePlanItem(
                isLast: true,
                icon: Icons.content_cut,
                name: 'Pruning',
                days: widget.plant.pruningPlan,
                onFrequencyChanged: _updatePruningPlan,
              );
            default:
              return Container();
          }
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 0);
        },
      ),
    );
  }
}

class CarePlanItem extends StatefulWidget {
  final IconData icon;
  final String name;
  final int days;
  final Function(String) onFrequencyChanged;
  final bool isFirst;
  final bool isLast;

  const CarePlanItem({
    required this.icon,
    required this.name,
    required this.days,
    required this.onFrequencyChanged,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  _CarePlanItemState createState() => _CarePlanItemState();
}

class _CarePlanItemState extends State<CarePlanItem> {
  String _selectedFrequency = '';

  void _showFrequencyPicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return FrequencyPicker(
          onSelected: (frequency) {
            setState(() {
              _selectedFrequency = frequency;
            });
            widget.onFrequencyChanged(frequency);
          },
          name: widget.name

        );
        
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: _showFrequencyPicker,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.isFirst) Divider(height: 0), 
          ListTile(
            leading: Icon(widget.icon),
            title: Text(widget.name, style: theme.textTheme.bodyMedium),
            subtitle: Text(
              _selectedFrequency.isNotEmpty
                  ? 'every $_selectedFrequency'
                  : 'every ${widget.days} days',
              style: theme.textTheme.bodySmall,
            ),
            trailing: Icon(Icons.chevron_right),
          ),
          if (widget.isLast) Divider(height: 0), 
        ],
      ),
    );
  }
}
