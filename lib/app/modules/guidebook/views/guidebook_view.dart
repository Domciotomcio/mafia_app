import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
        title: Text('mainTitle'.tr),
        centerTitle: true,
        actions: [
          GetBuilder<GuidebookController>(
            builder: (c) => TextButton(
                    onPressed: () => c.changeLanguage(),
                    child: Image.asset(controller.flagPath, width: 30))
                .animate()
                .fade(duration: const Duration(milliseconds: 2000)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            for (var el in controller.sections) ...[
              ListTile(
                title: Text(el.title.tr,
                    style: GoogleFonts.dancingScript(fontSize: 25)),
              ),
              const Divider(),
              for (var subEl in el.subSections) ...[
                TileWithImage(
                    imagePath: subEl.imagePath,
                    title: subEl.title.tr,
                    subtitle: subEl.subtitle.tr,
                    icon: subEl.icon,
                    route: subEl.route),
                const Divider(),
              ],
            ],
          ],
        ),
      ),
    );
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
      child: const DecoratedBox(
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

class TileWithImage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String? subtitle;
  final Icon icon;
  final String route;

  const TileWithImage({
    Key? key,
    required this.imagePath,
    required this.title,
    this.subtitle,
    required this.icon,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.darken),
        ),
      ),
      child: ListTile(
        leading: icon,
        title: Text(title,
            style: GoogleFonts.dancingScript(
                textStyle: GuidebookView.titleTextStyle)),
        subtitle: subtitle != null
            ? Text(subtitle!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                    ))
            : null,
        onTap: () => Get.toNamed(route),
        // leading: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
