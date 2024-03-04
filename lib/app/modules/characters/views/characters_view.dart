import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/app/constants/maps/fraction.dart';
import 'package:project/app/data/character/models/character.dart';
import 'package:project/app/modules/character/bindings/character_binding.dart';
import 'package:project/app/modules/character/views/character_view.dart';
import 'package:project/app/shared/widgets/background_widget.dart';

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
            icon: const Icon(Icons.sort_outlined),
          ),
          IconButton(icon: const Icon(Icons.info_outline), onPressed: () {}),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
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
                  color: Colors.black.withOpacity(0.8),
                ),
                ListTile(
                  title: Text(character.name,
                      style: GoogleFonts.dancingScript(fontSize: 24)),
                  subtitle: Text(character.otherNames.join(', '),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontStyle: FontStyle.italic,
                          )),
                  trailing: fraction.image,
                  // onTap: () => Get.to(const CharacterView(),
                  //     binding: CharacterBinding(),
                  //     arguments: {'bla': "JEJ", 'id': character}),
                  onTap: () {
                    print(character);
                    Get.toNamed("/character/${character.id}", arguments: {
                      'bla': "JEJ",
                      'id': character,
                    });
                  },
                ),
              ],
            )
                .animate()
                .slideX(delay: Duration(milliseconds: index * 100))
                .fadeIn(duration: const Duration(milliseconds: 800));
          },
          separatorBuilder: (context, index) => const SizedBox(height: 3),
        ),
        onLoading: Center(
            child: const CircularProgressIndicator(
          color: Colors.white,
        ).animate().fadeIn(
                  duration: const Duration(milliseconds: 1200),
                )),
        onError: (error) => Center(child: Text('Error: $error')),
        onEmpty: const Center(child: Text('No data')),
      ),
    );
  }
}
