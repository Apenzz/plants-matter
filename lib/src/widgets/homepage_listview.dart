
import 'package:flutter/material.dart';

class HomepageListview extends StatelessWidget {

  HomepageListview({super.key});

  final List<String> plantList = ['Plant #1', 'Plant #2', 'Plant #3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Plants'),
      ),
      body: ListView.builder(
        itemCount: plantList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(plantList[index]),
          );
        }
      )
    );
  }
}