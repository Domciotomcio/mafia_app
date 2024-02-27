import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/data/character/models/character.dart';

import '../controllers/characters_controller.dart';

class CharactersView extends GetView<CharactersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Postacie'),
      ),
      body: controller.obx(
        (state) => ListView.separated(
          itemCount: state!.length,
          itemBuilder: (context, index) {
            Character character = state[index];

            return ListTile(
              title: Text(character.name),
              onTap: () => Get.toNamed('/character/${character.id}'),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        ),
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (error) => Center(child: Text('Error: $error')),
        onEmpty: const Center(child: Text('No data')),
      ),
    );
  }
}
