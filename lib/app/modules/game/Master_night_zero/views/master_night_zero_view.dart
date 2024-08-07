import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/app/modules/game/Master_night_zero/controllers/master_night_zero_controller.dart';
import 'package:project/app/shared/widgets/background_widget.dart';

import '../../../../constants/maps/fraction.dart';
import '../../../../shared/widgets/grey_divider.dart';
import 'master_day_zero_view.dart';

class MasterNightZeroView extends GetView<MasterNightZeroController> {
  MasterNightZeroView({Key? key}) : super(key: key);

  var NightZeroPhases = [
    // KEEP HERE ALL PLAYERS?
    'mafia',
  ];

  var MafiaWavingOrder = [
    'mafiaLeader',
    'coquette',
    'terrorist',
    'blackMailer',
    'mafiaGunslinger',
    'mafiaMember'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MasterNightZeroView'.tr),
          centerTitle: true,
        ),
        body: BackgroundWidget(
          child: Container(
            padding: const EdgeInsets.all(8),
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Miasto zasypia. Wszyscy zamykają oczy."),
                  const GreyDivider(),
                  const Text(
                      "Budzi się Mafia. Mafia poznaje swoich członków. Pomacha nam:"),
                  const GreyDivider(),
                  for (NightZeroPlayer p in controller.playersActiveNightZero)
                    Obx(() => ListTile(
                          title: Text("${p.player.character!.name}",
                              style: p.hasWokenUp.value
                                  ? const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey)
                                  : null),
                          leading:
                              fractionMap[p.player.character!.fraction]!.image,
                          trailing: Text(p.player.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                              )),
                          onTap: () => p.hasWokenUp.value = !p.hasWokenUp.value,
                        )),
                  //Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                        onPressed: () => Get.offAll(() => MasterDayZeroView()),
                        child: const Text(
                          "Dalej",
                        )),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class WakeWidget extends GetView<MasterNightZeroController> {
  final title;
  final String? subtitle;
  final fraction;

  WakeWidget({
    super.key,
    this.title,
    this.subtitle,
    required this.fraction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: fractionMap[fraction]!.image,
          title: Text(title, style: const TextStyle(fontSize: 20)),
          subtitle: subtitle != null ? Text(subtitle!) : null,
        ),
        const Divider(),
        for (NightZeroPlayer player in controller.playersActiveNightZero)
          Obx(() {
            var myPlayer = controller.playersActiveNightZero
                .firstWhere((element) => element.player.id == player.player.id);
            return ListTile(
                title: Text(
                    "Pomacha nam ${myPlayer.player.character!.name} ${myPlayer.player.name}",
                    style: const TextStyle(fontSize: 16)),
                dense: true,
                onTap: () => print("Tapped"),
                trailing: Checkbox(
                  value: controller.playersActiveNightZero
                      .firstWhere(
                          (element) => element.player.id == player.player.id)
                      .hasWokenUp
                      .value,
                  onChanged: (value) {
                    controller.playersActiveNightZero
                        .firstWhere(
                            (element) => element.player.id == player.player.id)
                        .hasWokenUp
                        .value = value!;
                  },
                ));
          }),
        const SizedBox(height: 25),
      ],
    );
  }
}
