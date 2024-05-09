import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/app/constants/lists/characters_images_paths.dart';
import 'package:project/app/constants/lists/fractions_images_paths.dart';
import 'package:project/app/modules/how_to_play/views/how_to_play_view.dart';
import '../../../shared/widgets/background_widget.dart';
import '../controllers/guidebook_controller.dart';

class GuidebookView extends GetView<GuidebookController> {
  GuidebookView({Key? key}) : super(key: key);

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
          // IconButton(
          //   onPressed: () => Get.toNamed('/roles'),
          //   icon: const Icon(Icons.menu),
          // ),
          // Obx(
          //   () => TextButton(
          //       onPressed: () => controller.changeLanguage(),
          //       child: Image.asset(controller.flagPath.value, width: 30)),
          // )
          // TextButton(
          //     onPressed: () {
          //       print('HA!');
          //       Get.updateLocale(const Locale('pl', 'PL'));
          //     },
          //     child: Image.asset(controller.flagPath, width: 30))
          GetBuilder<GuidebookController>(
            builder: (c) => TextButton(
                    onPressed: () => c.changeLanguage(),
                    child: Image.asset(controller.flagPath, width: 30))
                .animate()
                .fade(duration: Duration(milliseconds: 2000)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            // ListTile(
            //   title: Text(
            //     'game'.tr,
            //   ),
            // ),

            for (var el in controller.sections) ...[
              ListTile(
                title: Text(el.title.tr,
                    style: GoogleFonts.dancingScript(fontSize: 25)),
              ),
              Divider(),
              for (var subEl in el.subSections) ...[
                TileWithImage(
                    imagePath: subEl.imagePath,
                    title: subEl.title.tr,
                    subtitle: subEl.subtitle.tr,
                    icon: subEl.icon,
                    route: subEl.route),
                Divider(),
              ],
            ],

            // ListTile(
            //   title: Text('Rozgrywka',
            //       style: GoogleFonts.dancingScript(fontSize: 25)),
            // ),
            // Divider(),
            // TileWithImage(
            //   imagePath: 'assets/images/cubes.jpg',
            //   title: 'Zagraj',
            //   icon: Icon(Icons.arrow_forward_ios_rounded),
            //   route: '/game-setup',
            //   subtitle: 'Rozpocznij rozgrywkę w grę w mafię',
            // ),
            // Divider(),
            // ListTile(
            //   title: Text('Poradnik',
            //       style: GoogleFonts.dancingScript(fontSize: 25)),
            // ),
            // Divider(),
            // TileWithImage(
            //     imagePath: 'assets/images/main_menu/how_to_play.jpg',
            //     title: 'Jak grać?',
            //     subtitle: 'Poznaj zasady gry w mafię',
            //     icon: Icon(Icons.info_outline_rounded),
            //     route: '/how-to-play'),
            // Divider(),

            // ListTile(
            //   title: Text('Kompendium',
            //       style: GoogleFonts.dancingScript(fontSize: 25)),
            //   titleAlignment: ListTileTitleAlignment.center,
            //   leading: null,
            // ),
            // Divider(),
            // TileWithImage(
            //     imagePath: 'assets/images/characters/blackmailer.jpg',
            //     title: 'Postacie',
            //     icon: Icon(Icons.person_outline_rounded),
            //     route: '/characters',
            //     subtitle: 'Poznaj postacie z gry Mafia'),
            // Divider(),
            // TileWithImage(
            //   imagePath: 'assets/images/fractions/mafia.jpg',
            //   title: 'Frakcje',
            //   icon: Icon(Icons.groups_outlined),
            //   route: '/fractions',
            //   subtitle: 'Poznaj frakcje z gry Mafia',
            // ),
            // Divider(),
            // TileWithImage(
            //     imagePath: 'assets/images/cubes.jpg',
            //     title: 'Lokacje',
            //     icon: Icon(Icons.map_outlined),
            //     route: '/locations',
            //     subtitle: 'Poznaj lokacje z gry Mafia'),
            // Divider(),
            // ListTile(
            //   title:
            //       Text('Inne', style: GoogleFonts.dancingScript(fontSize: 25)),
            // ),
            // Divider(),
            // TileWithImage(
            //     imagePath: 'assets/images/main_menu/settings.jpg',
            //     title: 'Ustawienia',
            //     subtitle: 'Dostosuj ustawienia gry',
            //     icon: Icon(Icons.settings_outlined),
            //     route: '/settings'),
            // Divider(),
            // TileWithImage(
            //     imagePath: 'assets/images/cubes.jpg',
            //     title: 'Dodatkowe informacje',
            //     subtitle: 'Autorzy, kontakt',
            //     icon: Icon(Icons.info_outline_rounded),
            //     route: '/additional-info'),
            // Divider(),
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
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center, // Center the gradient like a vignette
            radius: 0.9, // Adjust the radius as needed
            colors: const [
              Colors.transparent,
              Colors.black, // Adjust the opacity for effect strength
            ],
            stops: const [
              0.8,
              1.0
            ], // Adjust for a softer or sharper vignette edge
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
