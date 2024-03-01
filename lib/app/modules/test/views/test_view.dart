import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/test_controller.dart';

class TestView extends GetView<TestController> {
  const TestView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestView'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/characters/cattani.jpg'),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/characters/cattani.jpg'),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                    colorFilter: ColorFilter.mode(
                        const Color.fromARGB(255, 0, 0, 0), BlendMode.darken),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.amber,
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.amber,
                child: Column(children: [
                  for (var i = 0; i < 30; i++)
                    ListTile(
                      leading: Icon(Icons.info_outline_rounded),
                      title: Text('O grze',
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
