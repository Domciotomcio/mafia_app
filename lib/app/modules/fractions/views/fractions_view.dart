import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/app/data/fraction/models/fraction.dart';

import '../controllers/fractions_controller.dart';

class FractionsView extends GetView<FractionsController> {
  const FractionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frakcje'),
        actions: [
          IconButton(icon: const Icon(Icons.info_outline), onPressed: () {}),
        ],
      ),
      backgroundColor: Colors.black,
      body: ListView.separated(
        itemCount: controller.fractions.length,
        separatorBuilder: (context, index) => const SizedBox(height: 3),
        itemBuilder: (context, index) {
          var fraction = controller.fractions[index]!;
          return FractionListItem(fraction: fraction, index: index)
              .animate()
              .slideX(
                delay: Duration(milliseconds: index * 100),
              )
              .fadeIn(duration: const Duration(milliseconds: 800));
        },
      ),
    );
  }
}

class FractionListItem extends StatelessWidget {
  const FractionListItem({
    super.key,
    required this.fraction,
    required this.index,
  });

  final Fraction fraction;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(fraction);
        Get.toNamed('/fraction/${fraction.name}', arguments: {'id': fraction});
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          // Stack(
          //     clipBehavior: Clip.antiAlias,
          //     alignment: Alignment.bottomCenter,
          //     children: [
          //       Stack(
          //         children: [
          //           Image.asset(
          //             fraction.imagePath,
          //             width: double.infinity,
          //             height: 220,
          //             fit: BoxFit.cover,
          //             colorBlendMode: BlendMode.darken,
          //             color: fraction.color.withOpacity(0.3),
          //           ),
          //           Positioned(
          //             bottom: 0.0,
          //             left: 0.0,
          //             right: 0.0,
          //             child: Container(
          //               height: 150.0, // Height of the gradient
          //               decoration: BoxDecoration(
          //                 gradient: LinearGradient(
          //                   begin: Alignment.bottomCenter,
          //                   end: Alignment.topCenter,
          //                   colors: [
          //                     Colors.black.withOpacity(0.7),
          //                     Colors.transparent
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //       Text(
          //         fraction.name,
          //         style: GoogleFonts.dancingScript(
          //           fontSize: 50,
          //           color: Colors.white,
          //         ),
          //       ),
          //     ]),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: fraction.image,
          // ),
          FractionImage(fraction: fraction),
          FractionName(fraction: fraction),
          FractionIcon(fraction: fraction),
        ],
      ),
    );
  }
}

class FractionImage extends StatelessWidget {
  final Fraction fraction;

  const FractionImage({super.key, required this.fraction});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.bottomCenter,
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
                colors: [Colors.black.withOpacity(0.7), Colors.transparent],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FractionName extends StatelessWidget {
  final Fraction fraction;

  const FractionName({super.key, required this.fraction});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 16,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color: fraction.color.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 30,
                offset: const Offset(0, 3),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                spreadRadius: 10,
                blurRadius: 30,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Text(
            fraction.name,
            style: GoogleFonts.dancingScript(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class FractionIcon extends StatelessWidget {
  final Fraction fraction;

  const FractionIcon({super.key, required this.fraction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: fraction.image,
    );
  }
}
