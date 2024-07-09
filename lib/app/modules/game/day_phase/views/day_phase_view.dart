import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/app/modules/game/Master/views/master_view.dart';
import 'package:project/app/shared/widgets/next_button.dart';
import 'package:project/app/shared/widgets/player_list_tile.dart';

import '../../../../constants/enums/fraction.dart';
import '../../../../constants/maps/fraction.dart';
import '../../Master/controllers/master_controller.dart';
import '../../game_setup/controllers/game_setup_controller.dart';
import '../controllers/day_phase_controller.dart';

class DayPhaseView extends GetView<DayPhaseController> {
  const DayPhaseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isAssassinationSuccess = Get.arguments['isAssassinationSuccess'];
    final assassinatedPlayer = Get.arguments['assasinatedPlayer'];

    return Scaffold(
      appBar: AppBar(
        title: Text('DayPhaseView'.tr),
        centerTitle: true,
      ),
      body: Column(
        children: [
          AssasinatioResultWidget(isAssassinationSuccess,
              p: assassinatedPlayer),
          const Divider(),
          WeatherForecastWidget(),
          const Divider(),
          VotingCheckOrKillWidget(),
          const Divider(),
          Text("Głosowanie na gracza:"),
          Obx(() => PlayerToElWiget()),
          const Divider(),
          NextButton(
              onPressed: () => Get.toNamed('/night-phase'), text: "Dalej"),
        ],
      ),
    );
  }
}

Widget AssasinatioResultWidget(bool isAssassinationSuccess,
    {Player? p = null}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text("W nocy miał miejsce "),
          if (isAssassinationSuccess)
            Text("udany",
                style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
          if (!isAssassinationSuccess)
            Text("nieudany",
                style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
          Text(" zamach."),
        ],
      ),
      if (isAssassinationSuccess && p != null)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Wyeliminowano graczy:"),
            ),
            ListTile(
              title: Text(p.name, style: const TextStyle(color: Colors.red)),
              subtitle: Text(
                p.character!.name,
                style: const TextStyle(color: Colors.grey),
              ),
              leading: fractionMap[p.character!.fraction]!.image,
              onTap: null,
            )
          ],
        ),
    ],
  );
}

Widget VotingCheckOrKillWidget() {
  final controller = Get.find<DayPhaseController>();

  return Column(
    children: [
      RichText(
        text: TextSpan(
          text: 'Głosowanie ',
          children: <TextSpan>[
            TextSpan(
                text: 'sprawdzanie',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
            TextSpan(text: ' czy '),
            TextSpan(
                text: 'zabijanie',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
          ],
        ),
      ),
      Obx(() => SegmentedButton(
            segments: [
              ButtonSegment(
                  value: CheckOrKill.check, label: Text("Sprawdzanie")),
              ButtonSegment(value: CheckOrKill.kill, label: Text("Zabijanie")),
            ],
            selected: {controller.checkOrKill.value},
            onSelectionChanged: (p0) {
              controller.setCheckOrKill(p0.first as CheckOrKill);
            },
            style: SegmentedButton.styleFrom(
                selectedBackgroundColor: Colors.white),
          )),
    ],
  );
}

Widget PlayerToElWiget() {
  final masterController = Get.find<MasterController>();
  final dayPhaseController = Get.find<DayPhaseController>();

  final checkOrKill = dayPhaseController.checkOrKill.value;
  final player = dayPhaseController.selectedPlayer.value;

  Widget personStatus(String status) {
    var text = "Ta osoba jest z ";
    var icon;

    switch (status) {
      case "townsfolk":
        text += "miasta.\n(Kciuk w górę)";
        icon = Icons.thumb_up_outlined;
        break;
      case "mafia":
        text += "mafii.\n(Kciuk w dół)";
        icon = Icons.thumb_down_outlined;
        break;
      case "sindicate":
        text += "syndykatu.\n(Kciuk poziomo)";
        icon = Icons.thumbs_up_down_outlined;
        break;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20)),
          SizedBox(height: 30),
          Icon(
            icon,
            size: 60,
          )
        ],
      ),
    );
  }

  String selectPlayerToCheck(Player player) {
    switch (player.character!.fraction) {
      case Fraction.townsfolk:
        return 'townsfolk';
      case Fraction.sindicate:
        return 'sindicate';
      default:
        return 'mafia';
    }
  }

  switch (checkOrKill) {
    case CheckOrKill.none:
      return ListTile(
        title: Text(
          "Wybierz zabijanie czy sprawdzanie",
          textAlign: TextAlign.center,
        ),
      );
    case CheckOrKill.check:
      return ListTile(
        title: Text(
          "Gracz do sprawdzenia",
          style: player != null
              ? TextStyle(
                  decoration: TextDecoration.lineThrough, color: Colors.grey)
              : null,
        ),
        subtitle: Text("Wybierz gracza do sprawdzenia",
            style: player != null
                ? TextStyle(
                    decoration: TextDecoration.lineThrough, color: Colors.grey)
                : null),
        trailing: player != null
            ? Text(player.name,
                style:
                    const TextStyle(fontSize: 16, fontStyle: FontStyle.italic))
            : Icon(Icons.person),
        onTap: () => dayPhaseController.checkOrKill.value != CheckOrKill.none
            ? Get.dialog(Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Wybierz osobę',
                        textAlign: TextAlign.center,
                      ),
                      const Divider(),
                      for (var player in masterController.playersList)
                        PlayerListTile(
                            player: player,
                            onPressed: () {
                              Get.back();
                              dayPhaseController.setSelectedPlayer(player);
                              Get.dialog(AlertDialog(
                                  content:
                                      personStatus(selectPlayerToCheck(player)),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Get.back(),
                                        child: const Text('Zamknij'))
                                  ]));
                            }),
                    ],
                  ),
                ),
              ))
            : null,
        //leading: fractionMap[p.character!.fraction]!.image,
      );
    case CheckOrKill.kill:
      return ListTile(
        title: Text("Gracz do zabicia",
            style: player != null
                ? TextStyle(
                    decoration: TextDecoration.lineThrough, color: Colors.grey)
                : null),
        subtitle: Text("Wybierz gracza do zabicia",
            style: player != null
                ? TextStyle(
                    decoration: TextDecoration.lineThrough, color: Colors.grey)
                : null),
        trailing: player != null
            ? Text(player.name,
                style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.red))
            : Icon(Icons.person),
        onTap: () => dayPhaseController.checkOrKill.value != CheckOrKill.none
            ? Get.dialog(Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Wybierz osobę',
                        textAlign: TextAlign.center,
                      ),
                      const Divider(),
                      for (var player in masterController.playersList)
                        PlayerListTile(
                            player: player,
                            onPressed: () {
                              Get.back();
                              dayPhaseController.setSelectedPlayer(player);
                            }),
                    ],
                  ),
                ),
              ))
            : null,
        //leading: fractionMap[p.character!.fraction]!.image,
      );
  }
}
