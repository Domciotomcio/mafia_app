import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../modules/character/bindings/character_binding.dart';
import '../modules/character/views/character_view.dart';
import '../modules/characters/bindings/characters_binding.dart';
import '../modules/characters/views/characters_view.dart';
import '../modules/create_character/bindings/create_character_binding.dart';
import '../modules/create_character/views/create_character_view.dart';
import '../modules/fraction/bindings/fraction_binding.dart';
import '../modules/fraction/views/fraction_view.dart';
import '../modules/fractions/bindings/fractions_binding.dart';
import '../modules/fractions/views/fractions_view.dart';
import '../modules/guidebook/bindings/guidebook_binding.dart';
import '../modules/guidebook/views/guidebook_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/how_to_play/bindings/how_to_play_binding.dart';
import '../modules/how_to_play/views/how_to_play_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.HOME;
  // static const INITIAL = Routes.CHARACTER;
  static const INITIAL = Routes.GUIDEBOOK;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CHARACTER,
      page: () => CharacterView(),
      binding: CharacterBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.GUIDEBOOK,
      page: () => const GuidebookView(),
      binding: GuidebookBinding(),
    ),
    GetPage(
      name: _Paths.CHARACTERS,
      page: () => CharactersView(),
      binding: CharactersBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.CREATE_CHARACTER,
      page: () => const CreateCharacterView(),
      binding: CreateCharacterBinding(),
    ),
    GetPage(
      name: _Paths.FRACTIONS,
      page: () => const FractionsView(),
      binding: FractionsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.FRACTION,
      page: () => const FractionView(),
      binding: FractionBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.HOW_TO_PLAY,
      page: () => const HowToPlayView(),
      binding: HowToPlayBinding(),
    ),
  ];
}
