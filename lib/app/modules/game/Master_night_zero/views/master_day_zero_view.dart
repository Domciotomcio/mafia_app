import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/game/Master/views/master_view.dart';

import '../controllers/master_night_zero_controller.dart';

class MasterDayZeroView extends GetView<MasterNightZeroController> {
  MasterDayZeroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MasterDayZeroView'.tr),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            "Koniec nocy 0, dzień 0, czas na pierwsze działania",
          ),
          const Divider(),
          const Text("Prognoza na dziś"),
          WeatherForecastWidget(),
          const Divider(),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
                onPressed: () => Get.offAllNamed('/night-phase'),
                child: const Text(
                  "Dalej",
                )),
          )
        ],
      ),
    );
  }
}
