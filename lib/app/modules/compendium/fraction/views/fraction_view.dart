import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project/app/modules/compendium/character/views/character_view.dart';
import 'package:project/app/shared/widgets/desc_with_label.dart';

import '../../../../data/fraction/models/fraction.dart' as fraction_model;

import '../../../../shared/widgets/main_image_widget.dart';
import '../controllers/fraction_controller.dart';

class FractionView extends GetView<FractionController> {
  FractionView({Key? key}) : super(key: key);

  final ScrollControllerWithGetX scrollControllerWithGetX =
      Get.put(ScrollControllerWithGetX());

  @override
  Widget build(BuildContext context) {
    // final fraction = fractionMap[fraction_enum.Fraction.mafia]!;
    final fraction = Get.arguments['id'] as fraction_model.Fraction;

    return Scaffold(
      body: fractionLoaded(fraction, context),
    );
  }

  Widget fractionLoaded(
      fraction_model.Fraction fraction, BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(fraction.imagePath),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
          colorFilter: ColorFilter.mode(
              fraction.color.withOpacity(0.3), BlendMode.darken),
        ),
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollControllerWithGetX.scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Stack of Scrolled Image
                MainImageWidget(
                    imagePath: fraction.imagePath,
                    imageAsset: Image.asset(
                      fraction.imagePath,
                      width: double.infinity,
                      height: 220,
                      fit: BoxFit.cover,
                      colorBlendMode: BlendMode.darken,
                      color: fraction.color.withOpacity(0.3),
                    ),
                    name: fraction.name),
                // Info Section
                Container(
                  color: Colors.black,
                  child: fractionInfoSection(fraction: fraction),
                ),
              ],
            ),
          ),
          // Top section
          Container(
            alignment: Alignment.topLeft,
            //color: Colors.red,
            padding: const EdgeInsets.all(16),
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 0.1,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back),
                iconSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget fractionInfoSection({required fraction_model.Fraction fraction}) {
  return Column(
    children: [
      // Name
      DescWithLabel(label: "Opis", description: fraction.description),
      const Divider(),
      DescWithLabel(label: "Cel", description: fraction.target),
      const Divider(),
      DescWithLabel(label: "Historia", description: fraction.history),
    ],
  );
}
