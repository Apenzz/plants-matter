import 'package:flutter/material.dart';

class FrequencyPicker extends StatefulWidget {
  final Function(String) onSelected;
  final String name;

  FrequencyPicker({required this.onSelected, required this.name});

  @override
  _FrequencyPickerState createState() => _FrequencyPickerState();
}

class _FrequencyPickerState extends State<FrequencyPicker> {
  String _selectedUnit = 'Days';
  int _selectedValue = 1;

  List<String> units = ['Days', 'Weeks', 'Months'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Select ${widget.name} Frequency',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton<int>(
                value: _selectedValue,
                items: List.generate(30, (index) => index + 1)
                    .map((value) => DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              ),
              DropdownButton<String>(
                value: _selectedUnit,
                items: units
                    .map((unit) => DropdownMenuItem<String>(
                          value: unit,
                          child: Text(unit),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedUnit = value!;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              widget.onSelected('$_selectedValue $_selectedUnit');
              Navigator.pop(context);
            },
            child: Text('Done'),
          ),
        ],
      ),
    );
  }
}