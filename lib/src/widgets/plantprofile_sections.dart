import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/plant.dart';

class PlantSection extends StatelessWidget {
  final String title;
  final List<String> content;
  final String buttonText;
  final Plant plant;

  const PlantSection({
    super.key,
    required this.title,
    required this.content,
    required this.buttonText,
    required this.plant,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.headlineSmall),
                    SizedBox(height: 8),
                    ...content.map((item) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('• ', style: Theme.of(context).textTheme.bodyMedium),
                        Expanded(
                          child: Text(
                            item,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    )).toList(),
                  ],
                ),
              ),
              Container(
                height: 48, // Adjust height here
                width: 120, // Adjust width here
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, // Remove any default padding
                    foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer, // Text color
                    backgroundColor: Theme.of(context).colorScheme.secondaryContainer, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    if (buttonText == 'Additional infos') {
                      GoRouter.of(context).go('/myplants/${plant.id}/infos');
                    }
                    if (buttonText == 'Change plan') {
                      GoRouter.of(context).go('/myplants/${plant.id}/settings');
                    }
                    
                  },
                  child: buttonText == 'Diagnose' ? 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt_outlined), // Camera icon
                        SizedBox(width: 4), // Add some spacing
                        Text(
                          buttonText,
                          maxLines: 1, // Ensure text appears on one line
                          overflow: TextOverflow.ellipsis, // Handle text overflow with ellipsis
                        ),
                      ],
                    ) :
                    Text(
                      buttonText,
                      maxLines: 1, // Ensure text appears on one line
                      overflow: TextOverflow.ellipsis, // Handle text overflow with ellipsis
                    ),
                ),
              ),
            ],
          ),
          if (title == 'Health Status') Divider(thickness: 2.0), // Add divider after the third section
        ],
      ),
    );
  }
}
