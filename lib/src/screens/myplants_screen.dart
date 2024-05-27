// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import '../data/plant.dart';
import '../data/myplants.dart';
import '../widgets/myplants_list.dart';

class MyPlantsScreen extends StatelessWidget {
  final String title;
  final ValueChanged<Plant> onTap;

  const MyPlantsScreen({
    required this.onTap,
    this.title = 'Plants',
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: MyPlantsList(
          plants: myPlantsInstance.myPlants,
          onTap: onTap,
        ),
      );
}
