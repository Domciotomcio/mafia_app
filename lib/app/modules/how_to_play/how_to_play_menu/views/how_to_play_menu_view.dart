import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/how_to_play_menu_controller.dart';

class HowToPlayMenuView extends GetView<HowToPlayMenuController> {
  const HowToPlayMenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var tutorial = controller.tutorial;
    return Scaffold(
      appBar: AppBar(
        title: Text('HowToPlayMenuView'.tr),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: tutorial.sections.length,
        //separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          var section = tutorial.sections[index];
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(section.imagePath),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.8), BlendMode.darken),
              ),
            ),
            child: ExpansionTile(
              title: Text(
                section.title,
                style: GoogleFonts.dancingScript(fontSize: 25),
              ),
              subtitle: Text(section.subtitle),
              leading: Icon(section.icon),
              children: [
                for (var subSection in section.subSections)
                  ListTile(
                    title: Row(
                      children: [
                        Text(
                          subSection.title,
                          style: GoogleFonts.dancingScript(fontSize: 20),
                        ),
                        SizedBox(width: 10),
                        Expanded(child: const Divider()),
                      ],
                    ),
                    trailing:
                        const Icon(Icons.arrow_forward_ios_rounded, size: 12),
                    //subtitle: Text(subSection.content),
                    onTap: () =>
                        Get.toNamed('/how-to-play', arguments: section),
                  ),
              ],
            ),
          )
              .animate()
              .slideX(delay: Duration(milliseconds: index * 200))
              .fadeIn(duration: const Duration(milliseconds: 1000));
        },
      ),
    );
  }
}

class TileWithImage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String? subtitle;
  final Icon icon;

  const TileWithImage({
    Key? key,
    required this.imagePath,
    required this.title,
    this.subtitle,
    required this.icon,
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
              fontSize: 25,
              color: Colors.white,
            )),
        subtitle: subtitle != null
            ? Text(subtitle!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                    ))
            : null,
        //onTap: () => Get.toNamed(route),
        // leading: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
