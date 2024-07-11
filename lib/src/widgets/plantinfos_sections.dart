import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final List<String> content;

  const InfoSection({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: 8),
          ...content.map((item) {
            final parts = item.split(':');
            final boldPart = parts.isNotEmpty ? parts[0] : '';
            final regularPart = parts.length > 1 ? parts.sublist(1).join(':') : '';

            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• ', style: Theme.of(context).textTheme.bodyMedium),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '$boldPart: ',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: regularPart,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          if (title == 'Health Status') Divider(thickness: 2.0), // Add divider after the third section
        ],
      ),
    );
  }
}
