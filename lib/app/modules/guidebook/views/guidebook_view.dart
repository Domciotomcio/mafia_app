import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/guidebook_controller.dart';

class GuidebookView extends GetView<GuidebookController> {
  const GuidebookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poradnik'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Jak grać?'),
            onTap: () => Get.toNamed('/howToPlay'),
          ),
          const Divider(),
          ListTile(
            title: const Text('Postacie'),
            onTap: () => Get.toNamed('/characters'),
          ),
          const Divider(),
          ListTile(
            title: const Text('Frakcje'),
            onTap: () => Get.toNamed('/houses'),
          ),
          const Divider(),
          FilledButton(
              onPressed: () => Get.toNamed('/create-character'),
              child: Text("Dodaj postać")),
        ],
      ),
    );
  }
}
