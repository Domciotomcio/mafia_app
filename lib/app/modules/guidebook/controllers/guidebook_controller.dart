import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: unused_import
import '../../../data/character/models/character.dart';

class GuidebookController extends GetxController {
  var flagPath = 'assets/images/flags/';

  var sections = [
    Section(
      title: 'game',
      subSections: [
        SubSection(
          title: 'playTitle',
          subtitle: 'playSubtitle',
          icon: const Icon(Icons.arrow_forward_ios_rounded),
          imagePath: 'assets/images/main_menu/start_game.jpg',
          route: '/game-setup',
        ),
        // SubSection(
        //   title: 'joinTitle',
        //   subtitle: 'joinSubtitle',
        //   icon: const Icon(Icons.arrow_forward_ios_rounded),
        //   imagePath: 'assets/images/main_menu/join_game.jpg',
        //   route: '/join-game',
        // ),
      ],
    ),
    Section(
      title: 'guidebook',
      subSections: [
        SubSection(
          title: 'guidebookTitle',
          subtitle: 'guidebookSubtitle',
          icon: const Icon(Icons.info_outline_rounded),
          imagePath: 'assets/images/main_menu/how_to_play.jpg',
          route: '/how-to-play-menu',
        ),
      ],
    ),
    Section(
      title: 'compendium',
      subSections: [
        SubSection(
          title: 'charactersTitle',
          subtitle: 'charactersSubtitle',
          icon: const Icon(Icons.person_outline_rounded),
          imagePath: 'assets/images/characters/blackmailer.jpg',
          route: '/characters',
        ),
        SubSection(
          title: 'fractionsTitle',
          subtitle: 'fractionsSubtitle',
          icon: const Icon(Icons.groups_outlined),
          imagePath: 'assets/images/fractions/mafia.jpg',
          route: '/fractions',
        ),
        // SubSection(
        //   title: 'locationsTitle',
        //   subtitle: 'locationsSubtitle',
        //   icon: const Icon(Icons.map_outlined),
        //   imagePath: 'assets/images/fractions/townsfolk.jpg',
        //   route: '/locations',
        // ),
        // SubSection(
        //   title: 'scenariosTitle',
        //   subtitle: 'scenariosSubtitle',
        //   icon: const Icon(Icons.import_contacts_outlined),
        //   imagePath: 'assets/images/main_menu/scenarios.jpg',
        //   route: '/scenarios',
        // ),
      ],
    ),
    Section(
      title: 'other',
      subSections: [
        SubSection(
          title: 'settingsTitle',
          subtitle: 'settingsSubtitle',
          icon: const Icon(Icons.settings_outlined),
          imagePath: 'assets/images/main_menu/settings.jpg',
          route: '/settings',
        ),
        SubSection(
          title: 'Dodatkowe informacje',
          subtitle: 'Autorzy, kontakt',
          icon: const Icon(Icons.info_outline_rounded),
          imagePath: 'assets/images/main_menu/additional_info.jpg',
          route: '/additional-info',
        ),
      ],
    ),
  ];

  @override
  void onInit() {
    flagPath = 'assets/images/flags/pl.png';
    super.onInit();
  }

  void changeLanguage() {
    // some logic for changing language
    if (flagPath == 'assets/images/flags/pl.png') {
      flagPath = 'assets/images/flags/en.png';
      Get.updateLocale(const Locale('en', 'US'));
    } else {
      flagPath = 'assets/images/flags/pl.png';
      Get.updateLocale(const Locale('pl', 'PL'));
    }
    update();
  }
}

class Section {
  final String title;
  final List<SubSection> subSections;

  Section({required this.title, required this.subSections});
}

class SubSection {
  final String title;
  final String subtitle;
  final Icon icon;
  final String imagePath;
  final String route;

  SubSection(
      {required this.title,
      required this.subtitle,
      required this.icon,
      required this.imagePath,
      required this.route});
}
