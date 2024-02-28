import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/fractions_controller.dart';

class FractionsView extends GetView<FractionsController> {
  const FractionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frakcje'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: controller.fractions.length,
        separatorBuilder: (context, index) => SizedBox(height: 3),
        itemBuilder: (context, index) {
          var fraction = controller.fractions[index]!;
          return Stack(
            alignment: Alignment.topRight,
            children: [
              Stack(
                  clipBehavior: Clip.antiAlias,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          fraction.imagePath,
                          width: double.infinity,
                          height: 220,
                          fit: BoxFit.cover,
                          colorBlendMode: BlendMode.darken,
                          color: fraction.color.withOpacity(0.3),
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            height: 150.0, // Height of the gradient
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.7),
                                  Colors.transparent
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      fraction.name,
                      style: GoogleFonts.dancingScript(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                  ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: fraction.image,
              ),
            ],
          );
        },
      ),
    );
  }
}
