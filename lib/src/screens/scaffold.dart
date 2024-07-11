

import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlantsmatterScaffold extends StatelessWidget {
  final Widget child;
  final int selectedIndex;

  const PlantsmatterScaffold({
    required this.child,
    required this.selectedIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final goRouter = GoRouter.of(context);

    return Scaffold(
      body: AdaptiveNavigationScaffold(
        selectedIndex: selectedIndex,
        body: child,
        onDestinationSelected: (idx) {
          if (idx == 0) goRouter.go('/');
          if (idx == 1) goRouter.go('/search');
          if (idx == 2) goRouter.go('/myplants');
        },
        destinations: const [
          AdaptiveScaffoldDestination(
            title: 'Home',
            icon: Icons.home,
          ),
          AdaptiveScaffoldDestination(
            title: 'Search',
            icon: Icons.search,
          ),
          AdaptiveScaffoldDestination(
            title: 'MyPlants',
            icon: Icons.yard,
          ),
        ],
      ),
    );
  }
}
