import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project/app/modules/game/game_setup/views/game_setup_summary.dart';

import '../modules/additional_info/bindings/additional_info_binding.dart';
import '../modules/additional_info/views/additional_info_view.dart';
import '../modules/compendium/character/bindings/character_binding.dart';
import '../modules/compendium/character/views/character_view.dart';
import '../modules/compendium/characters/bindings/characters_binding.dart';
import '../modules/compendium/characters/views/characters_view.dart';
import '../modules/compendium/fraction/bindings/fraction_binding.dart';
import '../modules/compendium/fraction/views/fraction_view.dart';
import '../modules/compendium/fractions/bindings/fractions_binding.dart';
import '../modules/compendium/fractions/views/fractions_view.dart';
import '../modules/compendium/location/bindings/location_binding.dart';
import '../modules/compendium/location/views/location_view.dart';
import '../modules/compendium/locations/bindings/locations_binding.dart';
import '../modules/compendium/locations/views/locations_view.dart';
import '../modules/compendium/scenario/bindings/scenario_binding.dart';
import '../modules/compendium/scenario/views/scenario_view.dart';
import '../modules/compendium/scenarios/bindings/scenarios_binding.dart';
import '../modules/compendium/scenarios/views/scenarios_view.dart';
import '../modules/create_character/bindings/create_character_binding.dart';
import '../modules/create_character/views/create_character_view.dart';
import '../modules/game/day_phase/bindings/day_phase_binding.dart';
import '../modules/game/day_phase/views/day_phase_view.dart';
import '../modules/game/Master_night_zero/bindings/master_night_zero_binding.dart';
import '../modules/game/Master_night_zero/views/master_night_zero_view.dart';
import '../modules/game/game_card/bindings/game_card_binding.dart';
import '../modules/game/game_card/views/game_card_view.dart';
import '../modules/game/game_setup/bindings/game_setup_binding.dart';
import '../modules/game/game_setup/views/game_setup_view.dart';
import '../modules/game/join_game/bindings/join_game_binding.dart';
import '../modules/game/join_game/views/join_game_view.dart';
import '../modules/guidebook/bindings/guidebook_binding.dart';
import '../modules/guidebook/views/guidebook_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/how_to_play/how_to_play/bindings/how_to_play_binding.dart';
import '../modules/how_to_play/how_to_play/views/how_to_play_view.dart';
import '../modules/how_to_play/how_to_play_menu/bindings/how_to_play_menu_binding.dart';
import '../modules/how_to_play/how_to_play_menu/views/how_to_play_menu_view.dart';
import '../modules/game/night_phase/bindings/night_phase_binding.dart';
import '../modules/game/night_phase/views/night_phase_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/test/bindings/test_binding.dart';
import '../modules/test/views/test_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.HOME;
  // static const INITIAL = Routes.CHARACTER;
  // ignore: constant_identifier_names
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
      transitionDuration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.GUIDEBOOK,
      page: () => const GuidebookView(),
      binding: GuidebookBinding(),
    ),
    GetPage(
      name: _Paths.CHARACTERS,
      page: () => const CharactersView(),
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
      transitionDuration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.FRACTION,
      page: () => FractionView(),
      binding: FractionBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.HOW_TO_PLAY,
      page: () => const HowToPlayView(),
      binding: HowToPlayBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.TEST,
      page: () => const TestView(),
      binding: TestBinding(),
    ),
    GetPage(
      name: _Paths.GAME_SETUP,
      page: () => GameSetupView(),
      binding: GameSetupBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.GAME_SETUP_SUMMARY,
      page: () => GameSetupSummary(),
      binding: GameSetupBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.LOCATIONS,
      page: () => const LocationsView(),
      binding: LocationsBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.ADDITIONAL_INFO,
      page: () => const AdditionalInfoView(),
      binding: AdditionalInfoBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.GAME_CARD,
      page: () => const GameCardView(),
      binding: GameCardBinding(),
    ),
    GetPage(
      name: _Paths.HOW_TO_PLAY_MENU,
      page: () => const HowToPlayMenuView(),
      binding: HowToPlayMenuBinding(),
    ),
    GetPage(
      name: _Paths.MASTER_NIGHT_ZERO,
      page: () => MasterNightZeroView(),
      binding: MasterNightZeroBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.SCENARIOS,
      page: () => const ScenariosView(),
      binding: ScenariosBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.SCENARIO,
      page: () => const ScenarioView(),
      binding: ScenarioBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.LOCATION,
      page: () => const LocationView(),
      binding: LocationBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.JOIN_GAME,
      page: () => const JoinGameView(),
      binding: JoinGameBinding(),
    ),
    GetPage(
      name: _Paths.NIGHT_PHASE,
      page: () => const NightPhaseView(),
      binding: NightPhaseBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.DAY_PHASE,
      page: () => const DayPhaseView(),
      binding: DayPhaseBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    ),
  ];
}
