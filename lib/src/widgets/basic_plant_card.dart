import 'package:flutter/material.dart';

class BasicPlantCard extends StatefulWidget {

  final String name;
  final String imagePath;
  final VoidCallback onComplete;

  const BasicPlantCard({super.key, required this.name, required this.imagePath, required this.onComplete});

  @override
  _BasicPlantCardState createState() => _BasicPlantCardState();

}

class _BasicPlantCardState extends State<BasicPlantCard> {

  List<bool> _isCompleted = [false,false,false];

  void _handleComplete(int id) {
    setState(() {
      _isCompleted[id] = true;
    });
    if (_isCompleted[id]) {
      widget.onComplete();
    }
  }

@override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.name),
        leading: CircleAvatar(
          backgroundImage: AssetImage(widget.imagePath),
          ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                _isCompleted[0] ? Icons.check_circle : Icons.compost,
                color: _isCompleted[0] ? Colors.grey : const Color.fromARGB(255, 192, 100, 51),
              ),
              onPressed: () => _handleComplete(0),
            ),
            IconButton(
              icon: Icon(
                _isCompleted[1] ? Icons.check_circle : Icons.content_cut,
                color: _isCompleted[1] ? Colors.grey : Colors.green,
              ),
              onPressed: () => _handleComplete(1),
            ),
            IconButton(
              icon: Icon(
                _isCompleted[2] ? Icons.check_circle : Icons.water_drop,
                color: _isCompleted[2] ? Colors.grey : Colors.blue,
              ),
              onPressed: () => _handleComplete(2),
            ),
          ],
        ),
        ),
      );
  }
}

  
