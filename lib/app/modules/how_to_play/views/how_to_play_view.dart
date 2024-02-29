import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
      body: PageView(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cubes.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.8), BlendMode.darken),
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
              Center(
                child: Text(
                  'Page 1',
                  style: TextStyle(fontSize: 32),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cubes.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.red.withOpacity(0.8), BlendMode.darken),
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
              Center(
                child: Text(
                  'Page 2',
                  style: TextStyle(fontSize: 32),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cubes.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.blue.withOpacity(0.8), BlendMode.darken),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Page 3',
                    style: TextStyle(fontSize: 32),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
