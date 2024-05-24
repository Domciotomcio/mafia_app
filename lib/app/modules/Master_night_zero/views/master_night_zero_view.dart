import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/app/modules/Master_night_zero/controllers/master_night_zero_controller.dart';

import '../../../constants/maps/fraction.dart';

class MasterNightZeroView extends GetView<MasterNightZeroController> {
  MasterNightZeroView({Key? key}) : super(key: key);

  var NightZeroPhases = [
    // KEEP HERE ALL PLAYERS?
    'mafia',
  ];

  var MafiaWavingOrder = [
    'mafiaLeader',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MasterNightZeroView'.tr),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Budzi się Mafia",
                    style: GoogleFonts.dancingScript(fontSize: 30)),
                const Divider(),
                const Text("Mafia poznaje swoich członków"),
                const SizedBox(height: 10),
                for (NightZeroPlayer p in controller.playersActiveNightZero)
                  Obx(() => ListTile(
                        title: Text("Pomacha nam ${p.player.character!.name}",
                            style: p.hasWokenUp.value
                                ? const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey)
                                : null),
                        subtitle: Text("Gracz: ${p.player.name}",
                            style: p.hasWokenUp.value
                                ? const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey)
                                : const TextStyle(color: Colors.grey)),
                        leading:
                            fractionMap[p.player.character!.fraction]!.image,
                        trailing: Checkbox(
                            value: p.hasWokenUp.value,
                            onChanged: (value) => p.hasWokenUp.value = value!),
                      )),
                // WakeWidget(
                //   title: "Budzi się cała Mafia",
                //   subtitle: "Mafia poznaje swoich członków",
                //   fraction: Fraction.mafia,
                // ),
                // WakeWidget(
                //   title: "Budzą się osoby z miasta",
                //   fraction: Fraction.townsfolk,
                // ),
                // controller.getPlayersToWakeUp(Fraction.sindicate).isNotEmpty
                //     ? WakeWidget(
                //         title: "Budzą się osoby z syndykatu",
                //         fraction: Fraction.sindicate,
                //       )
                //     : SizedBox(),
                // controller.getPlayersToWakeUp(Fraction.redMafia).isNotEmpty
                //     ? WakeWidget(
                //         title: "Budzą się Czerwona Mafia",
                //         subtitle: "Mafia poznaje swoich członków",
                //         fraction: Fraction.redMafia,
                //       )
                //     : SizedBox(),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                      onPressed: () {},
                      child: const Text(
                        "Dalej",
                      )),
                )
              ],
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
