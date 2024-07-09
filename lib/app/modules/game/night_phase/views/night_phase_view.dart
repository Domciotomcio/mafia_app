import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project/app/modules/game/Master/controllers/master_controller.dart';
import 'package:project/app/shared/widgets/next_button.dart';
import 'package:project/app/shared/widgets/player_list_tile.dart';

import '../../../../constants/enums/fraction.dart' as FractionEnum;
import '../../../../constants/maps/fraction.dart';
import '../controllers/night_phase_controller.dart';

class NightPhaseView extends GetView<NightPhaseController> {
  const NightPhaseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NightPhaseView'.tr),
        centerTitle: true,
      ),
      body: Column(
        children: [
          MafiaWakeWidget(),
          const Divider(),
          CattaniWakeWidget(),
          const Divider(),
          DoctorWakeWidget(),
          const Divider(),
          NextButton(onPressed: () => controller.nightSummary())
        ],
      ),
    );
  }
}

Widget MafiaWakeWidget() {
  final masterController = Get.find<MasterController>();
  final mafiaWakeController =
      Get.put<MafiaWakeController>(MafiaWakeController());

  print("Players List");
  print(masterController.playersList);

  return Column(
    children: [
      Obx(() => ListTile(
          leading: fractionMap[FractionEnum.Fraction.mafia]!.image,
          title: Text("Budzi się mafia",
              style: mafiaWakeController.checked.value
                  ? TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey)
                  : null),
          subtitle: Text("Mafia wybiera cel",
              style: mafiaWakeController.checked.value
                  ? TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey)
                  : null),
          trailing: mafiaWakeController.playerTarget.value == null
              ? Icon(Icons.person)
              : Text(mafiaWakeController.playerTarget.value!.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.red,
                  )),
          onTap: () => Get.dialog(
                Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Wybierz cel do zabicia',
                          textAlign: TextAlign.center,
                        ),
                        const Divider(),
                        for (var player in masterController.playersList)
                          PlayerListTile(
                              player: player,
                              onPressed: () {
                                mafiaWakeController.setPlayerTarget(player);
                                Get.back();
                              }),
                      ],
                    ),
                  ),
                ),
              ))),
    ],
  );
}

Widget CattaniWakeWidget() {
  final masterController = Get.find<MasterController>();
  final cattaniWakeController =
      Get.put<CattaniWakeController>(CattaniWakeController());

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

  return Obx(() => ListTile(
      leading: fractionMap[FractionEnum.Fraction.townsfolk]!.image,
      title: Text("Budzi się Cattani",
          style: cattaniWakeController.checked.value
              ? TextStyle(
                  decoration: TextDecoration.lineThrough, color: Colors.grey)
              : null),
      subtitle: Text("Cattani wybiera osobę do sprawdzenia",
          style: cattaniWakeController.checked.value
              ? TextStyle(
                  decoration: TextDecoration.lineThrough, color: Colors.grey)
              : null),
      trailing: cattaniWakeController.playerToCheck.value == null
          ? Icon(Icons.person)
          : Text(cattaniWakeController.playerToCheck.value!.name,
              style:
                  const TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
      onTap: () => Get.dialog(
            Dialog(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Wybierz osobę do sprawdzenia',
                      textAlign: TextAlign.center,
                    ),
                    const Divider(),
                    for (var player in masterController.playersList)
                      PlayerListTile(
                          player: player,
                          onPressed: () {
                            Get.back();
                            Get.dialog(AlertDialog(
                                content: personStatus(cattaniWakeController
                                    .selectPlayerToCheck(player)),
                                actions: [
                                  TextButton(
                                      onPressed: () => Get.back(),
                                      child: const Text('Zamknij'))
                                ]));
                          }),
                  ],
                ),
              ),
            ),
          )));
}

Widget DoctorWakeWidget() {
  final masterController = Get.find<MasterController>();
  final doctorWakeController =
      Get.put<DoctorWakeController>(DoctorWakeController());

  return Column(
    children: [
      Obx(() => ListTile(
          leading: fractionMap[FractionEnum.Fraction.townsfolk]!.image,
          title: Text("Budzi się lekarz",
              style: doctorWakeController.checked.value
                  ? TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey)
                  : null),
          subtitle: Text("Lekarz wybiera osobę do uleczenia",
              style: doctorWakeController.checked.value
                  ? TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey)
                  : null),
          trailing: doctorWakeController.playerToHeal.value == null
              ? Icon(Icons.person)
              : Text(doctorWakeController.playerToHeal.value!.name,
                  style: const TextStyle(
                      fontSize: 16, fontStyle: FontStyle.italic)),
          onTap: () => Get.dialog(
                Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Wybierz osobę do uleczenia',
                          textAlign: TextAlign.center,
                        ),
                        const Divider(),
                        for (var player in masterController.playersList)
                          PlayerListTile(
                              player: player,
                              onPressed: () {
                                doctorWakeController.healPlayer(player);
                                Get.back();
                              }),
                      ],
                    ),
                  ),
                ),
              ))),
      const Divider(),
    ],
  );
}
