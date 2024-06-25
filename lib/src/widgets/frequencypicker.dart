import 'package:flutter/material.dart';

class FrequencyPicker extends StatefulWidget {
  final Function(String) onSelected;
  final String name;

  FrequencyPicker({required this.onSelected, required this.name});

  @override
  _FrequencyPickerState createState() => _FrequencyPickerState();
}

class _FrequencyPickerState extends State<FrequencyPicker> {
  int _selectedValue = 1;
  String _selectedUnit = 'Days';

  List<String> units = ['Days', 'Weeks', 'Months'];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(80, 40),
                    foregroundColor: theme.colorScheme.onSecondaryContainer,
                    backgroundColor: theme.colorScheme.secondaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  '${widget.name} Frequency',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(80, 40),
                    foregroundColor: theme.colorScheme.onSecondaryContainer,
                    backgroundColor: theme.colorScheme.secondaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    widget.onSelected('$_selectedValue $_selectedUnit');
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Done',
                    style: TextStyle(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    perspective: 0.005,
                    diameterRatio: 1.2,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        _selectedValue = index + 1;
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedValue = index + 1;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                fontSize: 24,
                                color: _selectedValue == index + 1
                                    ? theme.colorScheme.secondary
                                    : theme.textTheme.bodyLarge?.color,
                                fontWeight: _selectedValue == index + 1
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: 30,
                    ),
                  ),
                ),
                Expanded(
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    perspective: 0.005,
                    diameterRatio: 1.2,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        _selectedUnit = units[index];
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedUnit = units[index];
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              units[index],
                              style: TextStyle(
                                fontSize: 24,
                                color: _selectedUnit == units[index]
                                    ? theme.colorScheme.secondary
                                    : theme.textTheme.bodyLarge?.color,
                                fontWeight: _selectedUnit == units[index]
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: units.length,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Selected: $_selectedValue $_selectedUnit',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
