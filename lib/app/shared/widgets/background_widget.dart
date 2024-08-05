import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  final String? imagePath;

  const BackgroundWidget({super.key, this.imagePath, required this.child});

  @override
  Widget build(BuildContext context) {
    print("imagePath: $imagePath");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imagePath != null
                ? AssetImage(imagePath!)
                : AssetImage('assets/images/hat.jpg'),
            fit: imagePath != null ? BoxFit.cover : BoxFit.fitWidth,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.darken),
          ),
        ),
        child: child,
      ),
    );
  }
}
