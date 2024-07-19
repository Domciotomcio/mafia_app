import 'package:get/get.dart';
import 'package:project/app/constants/enums/fraction.dart';

import '../../Master/controllers/master_controller.dart';
import '../../game_setup/controllers/game_setup_controller.dart';

class MasterNightZeroController extends GetxController {
  List<Player> playersList = [];
  late MasterController master;

  // KEEP IT UP TO DATE!!!
  List<String> charactersToWakeUp = [
    'mafiaLeader',
    'mafiaMember',
    'syndicateLeader',
  ];

  RxList<NightZeroPlayer> playersActiveNightZero = <NightZeroPlayer>[].obs;

  @override
  void onInit() {
    master = Get.find<MasterController>();
    playersList = master.playersList;
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
