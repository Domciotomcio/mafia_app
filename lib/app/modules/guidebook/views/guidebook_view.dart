import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/app/constants/lists/characters_images_paths.dart';
import 'package:project/app/constants/lists/fractions_images_paths.dart';

import '../controllers/guidebook_controller.dart';

class GuidebookView extends GetView<GuidebookController> {
  const GuidebookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double cardHeight = 80;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Poradnik do Gry'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRect(
                    child: Align(
                      alignment: Alignment.center,
                      heightFactor: 0.33,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 184, 184, 184)
                                  .withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/images/cubes.jpg',
                          height: cardHeight * 3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.9),
                      const Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
                      Colors.black.withOpacity(0.9),
                    ],
                  ),
                ),
                height: cardHeight,
              ),
              ListTile(
                leading: const Icon(Icons.info_outline_rounded),
                title: Text('Jak grać?',
                    style: GoogleFonts.dancingScript(
                      fontSize: 25,
                      color: Colors.white,
                    )),
                onTap: () => Get.toNamed('/how-to-play'),
              ),
            ],
          ),
          const Divider(),
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (var i in charactersImagesPaths)
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          widthFactor: 1,
                          child: Image.asset(
                            i,
                            height: cardHeight,
                          ),
                        ),
                        Container(
                          height: cardHeight,
                          width: cardHeight,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color.fromARGB(255, 0, 0, 0),
                                  Colors.transparent,
                                  Colors.transparent,
                                  Color.fromARGB(255, 0, 0, 0),
                                ]),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.9),
                      Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
                      Colors.black.withOpacity(0.9),
                    ],
                  ),
                ),
                height: cardHeight,
              ),
              ListTile(
                title: Text(
                  'Postacie',
                  style: GoogleFonts.dancingScript(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                leading: const Icon(Icons.person_outline_rounded),
                onTap: () => Get.toNamed(
                  '/characters',
                ),
              ),
            ],
          ),
          const Divider(),
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                child: Align(
                  alignment: Alignment.center,
                  heightFactor: 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (var i in fractionsImagesPaths)
                        Stack(
                          children: [
                            Image.asset(
                              i,
                              height: cardHeight * 2,
                            ),
                            Container(
                              height: cardHeight * 2,
                              width: cardHeight * 2,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromARGB(255, 0, 0, 0),
                                      Colors.transparent,
                                      Colors.transparent,
                                      Color.fromARGB(255, 0, 0, 0),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.9),
                      const Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
                      Colors.black.withOpacity(0.9),
                    ],
                  ),
                ),
                height: cardHeight,
              ),
              ListTile(
                leading: const Icon(Icons.groups_outlined),
                title: Text('Frakcje',
                    style: GoogleFonts.dancingScript(
                      fontSize: 25,
                      color: Colors.white,
                    )),
                onTap: () => Get.toNamed('/fractions'),
              ),
            ],
          ),
          const Divider(),
          // FilledButton(
          //     onPressed: () => Get.toNamed('/create-character'),
          //     child: const Text("Dodaj postać")),
          // ElevatedButton(onPressed: () {}, child: const Text("Dodaj frakcję")),
        ],
      ),
    );
  }
}
