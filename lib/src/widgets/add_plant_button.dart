import 'package:flutter/material.dart';

class AddPlantButton extends StatelessWidget {
  const AddPlantButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }
}