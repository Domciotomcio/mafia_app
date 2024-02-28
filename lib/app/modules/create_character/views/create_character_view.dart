import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_character_controller.dart';

class CreateCharacterView extends GetView<CreateCharacterController> {
  const CreateCharacterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // key for form
    final key = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('CreateCharacterView'),
          centerTitle: true,
        ),
        body: Form(
          key: key,
          child: Column(children: [
            TextFormField(
              onSaved: (newValue) => controller.name = newValue!,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              onSaved: (newValue) => controller.fraction = newValue!,
              decoration: const InputDecoration(labelText: 'Fraction'),
            ),
            TextFormField(
              onSaved: (newValue) => controller.quote = newValue!,
              decoration: const InputDecoration(labelText: 'quote'),
            ),
            TextFormField(
              onSaved: (newValue) => controller.description = newValue!,
              decoration: const InputDecoration(labelText: 'description'),
            ),
            TextFormField(
              onSaved: (newValue) => controller.story = newValue!,
              decoration: const InputDecoration(labelText: 'story'),
            ),
            TextFormField(
              onSaved: (newValue) =>
                  controller.suitabilityLevel = newValue! as int,
              decoration: const InputDecoration(labelText: 'suitabilityLevel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (key.currentState!.validate()) {
                  key.currentState!.save();
                }

                controller.createCharacter();
              },
              child: const Text('Create'),
            ),
          ]),
        ));
  }
}
