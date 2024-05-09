import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project/app/shared/widgets/loading_indicator_widget.dart';

import '../../../data/tutorial/models/chapter.dart';
import '../../../data/tutorial/models/tutorial.dart';
import '../controllers/how_to_play_controller.dart';

class HowToPlayView extends GetView<HowToPlayController> {
  const HowToPlayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HowToPlayView'),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) => PageView(
          children: [
            for (var chapter in controller.tutorial!.chapters)
              chapterWidget(chapter: chapter)
          ],
        ),
        onLoading: LoadingIndicatorWidget(),
      ),
    );
  }
}

class chapterWidget extends StatelessWidget {
  Color colorFilter;
  double colorOpacity;
  Chapter chapter;
  String imagePath;

  chapterWidget({
    super.key,
    this.colorFilter = Colors.black,
    this.colorOpacity = 0.8,
    required this.chapter,
    this.imagePath = 'assets/images/cubes.jpg',
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  colorFilter.withOpacity(colorOpacity), BlendMode.darken),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.black,
                Colors.transparent,
                Colors.transparent,
                Colors.black
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chapter.label,
                style: TextStyle(fontSize: 32),
                textAlign: TextAlign.left,
              ),
              Text(
                chapter.text,
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      ],
    );
  }
}
