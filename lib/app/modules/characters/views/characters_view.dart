import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/app/constants/maps/fraction.dart';
import 'package:project/app/data/character/models/character.dart';
import 'package:project/app/modules/character/bindings/character_binding.dart';
import 'package:project/app/modules/character/views/character_view.dart';

import '../controllers/characters_controller.dart';

class CharactersView extends GetView<CharactersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Postacie',
          style: GoogleFonts.dancingScript(fontSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed('/add-character'),
            icon: Icon(Icons.add),
          ),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
        backgroundColor: Colors.black,
        shadowColor: Colors.white,
      ),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: controller.obx(
        (state) => ListView.separated(
          itemCount: state!.length,
          itemBuilder: (context, index) {
            Character character = state[index];
            var fraction = fractionMap[character.fraction]!;

            return Stack(
              clipBehavior: Clip.antiAlias,
              children: [
                Image.asset(
                  character.imagePath,
                  width: double.infinity,
                  height: 70,
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.darken,
                  color: Colors.black.withOpacity(0.3),
                ),
                Container(
                  //color: fraction.color.withOpacity(0.1),
                  //color: Colors.black.withOpacity(0.3),
                  child: ListTile(
                    title: Text(character.name,
                        style: GoogleFonts.dancingScript(fontSize: 24)),
                    subtitle: Text(character.otherNames.join(', '),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontStyle: FontStyle.italic,
                            )),
                    trailing: fraction.image,
                    onTap: () => Get.to(CharacterView(),
                        binding: CharacterBinding(),
                        arguments: {'bla': "JEJ", 'id': character}),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 3),
        ),
        onLoading: const Center(
            child: CircularProgressIndicator(
          color: Colors.white,
        )),
        onError: (error) => Center(child: Text('Error: $error')),
        onEmpty: const Center(child: Text('No data')),
      ),
    );
  }
}
