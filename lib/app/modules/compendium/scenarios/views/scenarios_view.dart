import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/scenarios_controller.dart';

class ScenariosView extends GetView<ScenariosController> {
  const ScenariosView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScenariosView'),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            final scenario = controller.scenarios.values.elementAt(index);

            return ListTile(
              leading: const Icon(Icons.arrow_forward_ios_rounded),
              title: Text(scenario.title,
                  style: GoogleFonts.dancingScript(fontSize: 25)),
              subtitle: scenario.subtitle != null
                  ? Text(
                      scenario.subtitle!,
                    )
                  : null,
              onTap: () {
                Get.toNamed('/scenario', arguments: {'scenario': scenario});
              },
              trailing: scenario.isEighteenPlus
                  ? const Icon(Icons.eighteen_up_rating_outlined)
                  : null,
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: controller.scenarios.length),
    );
  }
}
