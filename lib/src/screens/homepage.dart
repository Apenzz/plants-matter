// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import '../data/plant.dart';
import '../data/myplants.dart';
import '../widgets/myplants_list.dart';

class HomePageScreen extends StatelessWidget {
  final String title;
  final ValueChanged<Plant> onTap;

  const HomePageScreen({
    required this.onTap,
    this.title = 'Plants matter',
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        floatingActionButton: FloatingActionButton.large(
                  onPressed: () {
                   
                  },
                  child: const Icon(Icons.add),
                ),
      );
}
