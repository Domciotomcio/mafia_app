import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/scenario_controller.dart';

class ScenarioView extends GetView<ScenarioController> {
  const ScenarioView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final scenario = controller.scenario;

    return Scaffold(
      appBar: AppBar(
        title: Text(scenario.title),
        centerTitle: true,
        actions: [
          if (scenario.isEighteenPlus)
            IconButton(
              icon: Icon(Icons.eighteen_up_rating_outlined),
              onPressed: () => Get.dialog(AlertDialog(
                title: Text('Dla dorosłych'),
                content: Text(
                    'Scenariusz zawiera treści przeznaczone dla osób pełnoletnich.'),
                actions: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Text('Zamknij'),
                  ),
                ],
              )),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                scenario.imagePath,
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (var el in scenario.description.entries) ...[
                      Column(
                        children: [
                          Text("${el.key}".tr,
                              style: GoogleFonts.dancingScript(fontSize: 24)),
                          Text(el.value, textAlign: TextAlign.justify),
                          SizedBox(height: 16),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
