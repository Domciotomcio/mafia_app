import 'package:get/get.dart';

import '../../../../constants/enums/fraction.dart' as FractionEnum;
import '../../game_setup/controllers/game_setup_controller.dart';

class NightPhaseController extends GetxController {
  //TODO: Implement NightPhaseController

  void nightSummary() {
    final mwc = Get.find<MafiaWakeController>();
    final cwc = Get.find<CattaniWakeController>();
    final dwc = Get.find<DoctorWakeController>();

    var isAssassinationSuccess = false;

    if (mwc.playerTarget.value != null) {
      print('Mafia wybrała: ${mwc.playerTarget.value!.name}');
    }

    if (cwc.playerToCheck.value != null) {
      print('Cattani sprawdza: ${cwc.playerToCheck.value!.name}');
    }

    if (dwc.playerToHeal.value != null) {
      print('Lekarz leczy: ${dwc.playerToHeal.value!.name}');
    }

    // check if assassination was successful
    if (mwc.playerTarget.value != null && dwc.playerToHeal.value != null) {
      if (mwc.playerTarget.value!.name == dwc.playerToHeal.value!.name) {
        isAssassinationSuccess = false;
        print('Mafia nie zabiła gracza');
      } else {
        isAssassinationSuccess = true;
        print('Mafia zabiła gracza');
      }
    }

    final arguments = {
      'isAssassinationSuccess': isAssassinationSuccess,
      'assasinatedPlayer': mwc.playerTarget.value,
    };

    Get.toNamed('/day-phase', arguments: arguments);
  }
}

class MafiaWakeController extends GetxController {
  Rx<Player?> playerTarget = Rx<Player?>(null);
  var checked = false.obs;

  bool setPlayerTarget(player) {
    playerTarget.value = player;
    checked.value = true;
    return true;
  }
}

class CattaniWakeController extends GetxController {
  Rx<Player?> playerToCheck = Rx<Player?>(null);
  var checked = false.obs;

  String selectPlayerToCheck(Player player) {
    playerToCheck.value = player;
    checked.value = true;

    switch (player.character!.fraction) {
      case FractionEnum.Fraction.townsfolk:
        return 'townsfolk';
      case FractionEnum.Fraction.sindicate:
        return 'sindicate';
      default:
        return 'mafia';
    }
  }
}

class DoctorWakeController extends GetxController {
  Rx<Player?> playerToHeal = Rx<Player?>(null);
  var checked = false.obs;

  bool healPlayer(Player player) {
    playerToHeal.value = player;
    checked.value = true;
    return true;
  }
}
