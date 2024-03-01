import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/app/constants/lists/characters_images_paths.dart';
import 'package:project/app/constants/lists/fractions_images_paths.dart';
import '../controllers/guidebook_controller.dart';

class GuidebookView extends GetView<GuidebookController> {
  const GuidebookView({Key? key}) : super(key: key);

  static const double cardHeight = 80;
  static const titleTextStyle = TextStyle(fontSize: 25, color: Colors.white);
  static final boxShadow = BoxShadow(
    color: const Color.fromARGB(255, 184, 184, 184).withOpacity(0.3),
    spreadRadius: 1,
    blurRadius: 5,
    offset: const Offset(0, 3),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poradnik do Gry'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildSection(
            'assets/images/cubes.jpg',
            'Jak grać?',
            Icons.info_outline_rounded,
            '/how-to-play',
            3,
          ),
          const Divider(),
          _buildCharacterSection(),
          const Divider(),
          _buildFractionSection(),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline_rounded),
            title: const Text('O grze',
                style: TextStyle(fontSize: 25, color: Colors.white)),
            onTap: () => Get.toNamed('/test'),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String imagePath, String title, IconData icon,
      String route, double heightFactor) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRect(
            clipBehavior: Clip.antiAlias,
            child: Align(
                alignment: Alignment.center,
                heightFactor: 0.3,
                child: _buildImage(imagePath, heightFactor))),
        _buildGradientOverlay(),
        _buildListTile(title, icon, route),
      ],
    );
  }

  Widget _buildImage(String imagePath, double heightFactor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, height: cardHeight * heightFactor),
      ],
    );
  }

  Widget _buildGradientOverlay() {
    return Container(
      height: cardHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.9),
            Colors.black.withOpacity(0.7),
            Colors.black.withOpacity(0.9),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(String title, IconData icon, String route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title,
          style: GoogleFonts.dancingScript(textStyle: titleTextStyle)),
      onTap: () => Get.toNamed(route),
    );
  }

  Widget _buildCharacterSection() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: charactersImagesPaths
              .map((path) => _buildCharacterImage(path))
              .toList(),
        ),
        _buildGradientOverlay(),
        _buildListTile('Postacie', Icons.person_outline_rounded, '/characters'),
      ],
    );
  }

  Widget _buildCharacterImage(String path) {
    return Image.asset(path, height: cardHeight);
  }

  Widget _buildFractionSection() {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          child: Align(
            alignment: Alignment.center,
            heightFactor: 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: fractionsImagesPaths
                  .map((path) => _buildFractionImage(path))
                  .toList(),
            ),
          ),
        ),
        _buildGradientOverlay(),
        _buildListTile('Frakcje', Icons.groups_outlined, '/fractions'),
      ],
    );
  }

  Widget _buildFractionImage(String path) {
    return Image.asset(path, height: cardHeight * 2);
  }
}

//CUSTOM IMAGE
class VignetteImageWidget extends StatelessWidget {
  final String imagePath;
  final double? height;

  const VignetteImageWidget({
    Key? key,
    required this.imagePath,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          //fit: BoxFit.cover,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center, // Center the gradient like a vignette
            radius: 0.9, // Adjust the radius as needed
            colors: [
              Colors.transparent,
              Colors.black, // Adjust the opacity for effect strength
            ],
            stops: [0.8, 1.0], // Adjust for a softer or sharper vignette edge
          ),
        ),
      ),
    );
  }
}
