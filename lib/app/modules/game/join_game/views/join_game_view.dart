import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/join_game_controller.dart';

class JoinGameView extends GetView<JoinGameController> {
  const JoinGameView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JoinGameView'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Join a game function in progress",
                  style: TextStyle(color: Colors.orange)),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter game code',
                ),
              ),
              SizedBox(height: 5),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: null,
                  child: Text('Join Game'),
                ),
              ),
            ],
          )),
    );
  }
}
