import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/scenario_controller.dart';

class ScenarioView extends GetView<ScenarioController> {
  const ScenarioView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final scenario = Get.arguments['scenario'];

    return Scaffold(
      appBar: AppBar(
        title: Text(scenario.title),
        centerTitle: true,
        actions: [
          if (scenario.isEighteenPlus)
            IconButton(
              icon: Icon(Icons.eighteen_up_rating_outlined),
              onPressed: () => Get.dialog(
                Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Scenariusz przeznaczony dla osób pełnoletnich.',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  scenario.imagePath,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        scenario.scenarioDescription,
                        style: GoogleFonts.dancingScript(fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 12),
                    for (var el in scenario.additionalInfo.entries) ...[
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${el.key}".tr),
                                  Text(el.value,
                                      style: GoogleFonts.dancingScript(
                                          fontSize: 20)),
                                ]),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (var el in scenario.description.entries) ...[
                    Column(
                      children: [
                        Text("${el.key}".tr),
                        Text(el.value,
                            style: GoogleFonts.dancingScript(fontSize: 20)),
                        SizedBox(height: 8),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
