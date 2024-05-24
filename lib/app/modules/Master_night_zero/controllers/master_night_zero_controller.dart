import 'package:get/get.dart';
import 'package:project/app/constants/enums/fraction.dart';

import '../../Master/controllers/master_controller.dart';
import '../../game_setup/controllers/game_setup_controller.dart';

class MasterNightZeroController extends GetxController {
  var playersList;

  late MasterController master;
  var gameSetup;

  // KEEP IT UP TO DATE!!!
  List<String> charactersToWakeUp = [
    'mafiaLeader',
    'syndicateLeader',
  ];

  RxList<NightZeroPlayer> playersActiveNightZero = <NightZeroPlayer>[].obs;

  @override
  void onInit() {
    gameSetup = Get.find<GameSetupController>();
    master = Get.find<MasterController>();

    playersList = gameSetup.players;

    // add all active players to list
    for (var f in Fraction.values) {
      playersActiveNightZero.addAll(getPlayersToWakeUp(f)
          .map((p) => NightZeroPlayer(player: p, hasWokenUp: false)));
    }

    super.onInit();
  }

  List<Player> getPlayersToWakeUp(Fraction fraction) {
    return playersList
        .where((player) => player.character!.fraction == fraction)
        .where(
            (player) => charactersToWakeUp.contains(player.character!.nameId))
        .toList();
  }
}

class NightZeroPlayer {
  final Player player;
  final RxBool hasWokenUp;

  NightZeroPlayer({
    required this.player,
    required bool hasWokenUp,
  }) : hasWokenUp = hasWokenUp.obs;
}
