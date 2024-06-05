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

  bool _isCompleted = false;

  void _handleComplete() {
    setState(() {
      _isCompleted = true;
    });
    if (_isCompleted) {
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
        trailing: IconButton(
          icon: Icon(
            _isCompleted ?Icons.check_circle : Icons.water_drop,
            color: Colors.blue,
          ),
          onPressed: _handleComplete,
        ),
        ),
      );
  }
}

  
