import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainImageWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final Image? imageAsset;

  const MainImageWidget({
    super.key,
    required this.imagePath,
    this.imageAsset,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // This box is sized of background image
        Opacity(
          opacity: 0.0,
          child: imageAsset ??
              Image.asset(
                imagePath,
                fit: BoxFit.fitWidth,
              ),
        ),
        // Bottom gradient of the image
        Container(
          height: 300,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color.fromARGB(255, 0, 0, 0), Colors.transparent],
            ),
          ),
        ),
        // Main Text
        Text(
          name,
          style: GoogleFonts.dancingScript(
            fontSize: 50,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
