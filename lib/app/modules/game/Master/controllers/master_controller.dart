import 'package:get/get.dart';
import 'package:project/app/constants/enums/fraction.dart';

import '../../game_setup/controllers/game_setup_controller.dart';

const NIGHT_PHASES = [
  'mafia',
  'cattani',
  'doctor',
];

const DAY_PHASES = [
  'voteCheckKill',
  'selectPlayer',
];

const NIGHT_ZERO_PHASES = [
  'mafia',
];

class MasterController extends GetxController {
  var gameSetup = Get.find<GameSetupController>();

  List<Player> playersList = [];
  List<Player> deadPlayers = [];

  @override
  void onInit() {
    // when the game starts, we get the players list from the game setup
    playersList = List.from(gameSetup.players);

    super.onInit();
  }

  /// Get the number of alive players from given fracion in the game
  int numOfPlayers(Fraction fraction) {
    return playersList
        .where((player) => player.character!.fraction == fraction)
        .toList()
        .length;
  }

  void movePlayerToDeadPlayers(Player player) {
    deadPlayers.add(player);
    playersList.remove(player);
  }
}
