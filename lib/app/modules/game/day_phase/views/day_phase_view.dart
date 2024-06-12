import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/app/modules/game/Master/views/master_view.dart';
import 'package:project/app/shared/widgets/next_button.dart';
import 'package:project/app/shared/widgets/player_list_tile.dart';

import '../../../../constants/maps/fraction.dart';
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
          Text("Głosowanie zabijanie czy sprawdzanie"),
          const Divider(),
          Text("Głosowanie na gracza:"),
          const Divider(),
          NextButton(onPressed: () {})
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
      Text("Skutki nocy",
          style: GoogleFonts.dancingScript(fontSize: 20),
          textAlign: TextAlign.start),
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
