// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import '../data/plant.dart';
import '../widgets/tab_plant_tasks.dart';
import '../widgets/add_plant_button.dart';

class HomePageScreen extends StatelessWidget {
  final String title;
  final ValueChanged<Plant> onTap;
  final List<String> plantList = const ['Plant #1', 'Plant #2', 'Plant #3'];

  const HomePageScreen({
    required this.onTap,
    this.title = 'Plants matter',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          bottom: const TabPlantTasks(),
        ),
        floatingActionButton: const AddPlantButton(),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: plantList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(plantList[index]),
                );
              },
            )
          ]
        )
      ),
    );
  }
}