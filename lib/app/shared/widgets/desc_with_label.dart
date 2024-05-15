import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescWithLabel extends StatelessWidget {
  final String label;
  final double width;
  final String description;

  const DescWithLabel({
    super.key,
    required this.label,
    this.width = double.infinity,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              //style: Theme.of(context).textTheme.labelLarge,
              style: GoogleFonts.dancingScript(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
            ),
          ],
        ));
  }
}
