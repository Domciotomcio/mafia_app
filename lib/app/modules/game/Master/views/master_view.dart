import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/maps/fraction.dart';
import '../../game_setup/controllers/game_setup_controller.dart';
import '../controllers/master_controller.dart';

class MasterView extends GetView<MasterController> {
  const MasterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MasterView'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: controller.playersList.length,
        itemBuilder: (context, index) {
          Player player = controller.playersList[index];

          return ListTile(
            title: Text(player.name),
            subtitle: Text(player.character!.name),
            leading: fractionMap[player.character?.fraction]!.image,
          );
        },
      ),
    );
  }
}

Widget WeatherForecastWidget() {
  final MasterController controller = Get.find<MasterController>();

  Map<String, int> numOfPlayers = {
    'all': controller.getNumberOfPlayers('all'),
    'townsfolk': controller.getNumberOfPlayers('townsfolk'),
    'mafia': controller.getNumberOfPlayers('mafia'),
    'sindicate': controller.getNumberOfPlayers('sindicate'),
    'red_mafia': controller.getNumberOfPlayers('red_mafia'),
  };

  return Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Prognoza pogody",
            style: GoogleFonts.dancingScript(fontSize: 20),
            textAlign: TextAlign.start),
        const Text("..."),
        Text(
          'Liczba postaci: ${numOfPlayers['all']}',
        ),
        Text("Liczba miastowych: ${numOfPlayers['townsfolk']}"),
        Text("Liczba mafii: ${numOfPlayers['mafia']}"),
        Text("Liczba syndykatu: ${numOfPlayers['sindicate']}"),
        Text("Liczba czerwonej mafii: ${numOfPlayers['red_mafia']}"),
      ],
    ),
  );
}
