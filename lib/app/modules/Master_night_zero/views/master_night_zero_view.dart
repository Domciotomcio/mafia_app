import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:project/app/modules/Master_night_zero/controllers/master_night_zero_controller.dart';

import '../../../constants/enums/fraction.dart';
import '../../../constants/maps/fraction.dart';
import '../../game_setup/controllers/game_setup_controller.dart';
import '../../Master/controllers/master_controller.dart';

class MasterNightZeroView extends GetView<MasterNightZeroController> {
  MasterNightZeroView({Key? key}) : super(key: key);

  var NightZeroPhases = [
    // KEEP HERE ALL PLAYERS?
    'mafia',
  ];

  var MafiaWavingOrder = [
    'mafiaLeader',
  ];

  var displayText = "NOC ZEROWA";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MasterView'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("NOC ZEROWA", style: TextStyle(fontSize: 30)),
                Divider(),
                Text("Zerowej nocy osoby poznają się."),
                SizedBox(
                  height: 40,
                ),
                WakeWidget(
                  title: "Budzi się cała Mafia",
                  subtitle: "Mafia poznaje swoich członków",
                  fraction: Fraction.mafia,
                  players: controller.getPlayersToWakeUp(Fraction.mafia),
                ),
                WakeWidget(
                  title: "Budzą się osoby z miasta",
                  fraction: Fraction.townsfolk,
                  players: controller.getPlayersToWakeUp(Fraction.townsfolk),
                ),
                controller.getPlayersToWakeUp(Fraction.sindicate).isNotEmpty
                    ? WakeWidget(
                        title: "Budzą się osoby z syndykatu",
                        fraction: Fraction.sindicate,
                        players:
                            controller.getPlayersToWakeUp(Fraction.sindicate),
                      )
                    : SizedBox(),
                controller.getPlayersToWakeUp(Fraction.redMafia).isNotEmpty
                    ? WakeWidget(
                        title: "Budzą się Czerwona Mafia",
                        subtitle: "Mafia poznaje swoich członków",
                        fraction: Fraction.redMafia,
                        players:
                            controller.getPlayersToWakeUp(Fraction.redMafia),
                      )
                    : SizedBox(),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                      onPressed: () {
                        print("dalej");
                      },
                      child: Text(
                        "Dalej",
                      )),
                )
              ],
            ),
          ),
        ));
  }
}

class WakeWidget extends StatelessWidget {
  final title;
  final String? subtitle;
  final fraction;
  final players;

  WakeWidget(
      {super.key, this.title, this.subtitle, this.fraction, this.players});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: fractionMap[fraction]!.image,
          title: Text(title, style: TextStyle(fontSize: 20)),
          subtitle: subtitle != null ? Text(subtitle!) : null,
        ),
        Divider(),
        for (var player in players)
          Column(
            children: [
              Row(
                children: [
                  Text("\u2022 Pomacha nam ${player.character!.name}"),
                  // add exception for PAVULON
                  SizedBox(width: 20),
                  Text(" ${player.name}",
                      style: TextStyle(fontStyle: FontStyle.italic)),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        SizedBox(height: 25),
      ],
    );
  }
}
