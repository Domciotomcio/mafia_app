import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../modules/Master/bindings/master_binding.dart';
import '../modules/Master/views/master_first_view.dart';
import '../modules/Master/views/master_view.dart';
import '../modules/Master_night_zero/bindings/master_night_zero_binding.dart';
import '../modules/Master_night_zero/views/master_night_zero_view.dart';
import '../modules/additional_info/bindings/additional_info_binding.dart';
import '../modules/additional_info/views/additional_info_view.dart';
import '../modules/compendium/character/bindings/character_binding.dart';
import '../modules/compendium/character/views/character_view.dart';
import '../modules/compendium/characters/bindings/characters_binding.dart';
import '../modules/compendium/characters/views/characters_view.dart';
import '../modules/create_character/bindings/create_character_binding.dart';
import '../modules/create_character/views/create_character_view.dart';
import '../modules/compendium/fraction/bindings/fraction_binding.dart';
import '../modules/compendium/fraction/views/fraction_view.dart';
import '../modules/compendium/fractions/bindings/fractions_binding.dart';
import '../modules/compendium/fractions/views/fractions_view.dart';
import '../modules/game_card/bindings/game_card_binding.dart';
import '../modules/game_card/views/game_card_view.dart';
import '../modules/game_preparing/bindings/game_preparing_binding.dart';
import '../modules/game_preparing/views/game_preparing_view.dart';
import '../modules/game_setup/bindings/game_setup_binding.dart';
import '../modules/game_setup/views/game_setup_view.dart';
import '../modules/guidebook/bindings/guidebook_binding.dart';
import '../modules/guidebook/views/guidebook_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/how_to_play/bindings/how_to_play_binding.dart';
import '../modules/how_to_play/views/how_to_play_view.dart';
import '../modules/how_to_play_menu/bindings/how_to_play_menu_binding.dart';
import '../modules/how_to_play_menu/views/how_to_play_menu_view.dart';
import '../modules/locations/bindings/locations_binding.dart';
import '../modules/locations/views/locations_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/test/bindings/test_binding.dart';
import '../modules/test/views/test_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.HOME;
  // static const INITIAL = Routes.CHARACTER;
  static const INITIAL = Routes.GUIDEBOOK;
  // static const INITIAL = Routes.GAME_CARD;
  // static const INITIAL = Routes.GAME_SETUP;

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
      page: () => GuidebookView(),
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
      page: () => FractionView(),
      binding: FractionBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.HOW_TO_PLAY,
      page: () => const HowToPlayView(),
      binding: HowToPlayBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.TEST,
      page: () => const TestView(),
      binding: TestBinding(),
    ),
    GetPage(
      name: _Paths.GAME_PREPARING,
      page: () => const GamePreparingView(),
      binding: GamePreparingBinding(),
    ),
    GetPage(
      name: _Paths.GAME_SETUP,
      page: () => GameSetupView(),
      binding: GameSetupBinding(),
    ),
    GetPage(
      name: _Paths.LOCATIONS,
      page: () => const LocationsView(),
      binding: LocationsBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.ADDITIONAL_INFO,
      page: () => const AdditionalInfoView(),
      binding: AdditionalInfoBinding(),
    ),
    GetPage(
      name: _Paths.GAME_CARD,
      page: () => GameCardView(),
      binding: GameCardBinding(),
    ),
    GetPage(
      name: _Paths.HOW_TO_PLAY_MENU,
      page: () => const HowToPlayMenuView(),
      binding: HowToPlayMenuBinding(),
    ),
    GetPage(
      name: _Paths.MASTER,
      page: () => MasterFirstView(),
      binding: MasterBinding(),
    ),
    GetPage(
      name: _Paths.MASTER_NIGHT_ZERO,
      page: () => MasterNightZeroView(),
      binding: MasterNightZeroBinding(),
    ),
  ];
}
