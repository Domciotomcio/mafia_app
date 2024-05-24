import 'package:get/get.dart';
import 'package:project/app/constants/enums/fraction.dart';
import 'package:project/app/data/character/models/character.dart';

import '../../../constants/enums/device.dart';

class GameSetupController extends GetxController {
  var numberOfPlayers = {
    'total': 5,
    'mafia': 1,
    'townsfolk': 3,
    'sindicate': 1,
    'redMafia': 0,
  }.obs;

  var selectedSegment = 1.obs;

  var players = <Player>[
    Player(
      id: '1',
      name: 'Gracz 1',
      device: Device.main,
    ),
    Player(
      id: '2',
      name: 'Gracz 2',
      device: Device.main,
    ),
    Player(
      id: '3',
      name: 'Gracz 3',
      device: Device.mobile,
    ),
    Player(
      id: '4',
      name: 'Gracz 4',
      device: Device.mobile,
    ),
    Player(
      id: '5',
      name: 'Gracz 5',
      device: Device.tablet,
    ),
  ].obs;

  var characters = <Character>[
    const Character(
      id: '1',
      name: 'Członek mafii',
      description: 'Zabij innego gracza',
      story: '',
      quote: '',
      fraction: Fraction.mafia,
      additionalInfo: {},
      howToPlay: [],
      rate: {},
      otherNames: [],
      imagePath: '',
    ),
    const Character(
      id: '2',
      name: 'Członek miasta',
      description: 'Zabij innego gracza',
      story: '',
      quote: '',
      fraction: Fraction.townsfolk,
      additionalInfo: {},
      howToPlay: [],
      rate: {},
      otherNames: [],
      imagePath: '',
    ),
    const Character(
      id: '2',
      name: 'Członek syndykatu',
      description: 'Zabij innego gracza',
      story: '',
      quote: '',
      fraction: Fraction.sindicate,
      additionalInfo: {},
      howToPlay: [],
      rate: {},
      otherNames: [],
      imagePath: '',
    ),
  ].obs;

  void onReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = players.removeAt(oldIndex);
    players.insert(newIndex, item);
  }

  void addPlayerToCount(Fraction fraction) {
    int calcTotalPlayers() {
      return numberOfPlayers['mafia']! +
          numberOfPlayers['townsfolk']! +
          numberOfPlayers['sindicate']! +
          numberOfPlayers['redMafia']!;
    }

    switch (fraction) {
      case Fraction.mafia:
        numberOfPlayers['mafia'] = numberOfPlayers['mafia']! + 1;
        break;
      case Fraction.townsfolk:
        numberOfPlayers['townsfolk'] = numberOfPlayers['townsfolk']! + 1;
        break;
      case Fraction.sindicate:
        numberOfPlayers['sindicate'] = numberOfPlayers['sindicate']! + 1;
        break;
      case Fraction.redMafia:
        numberOfPlayers['redMafia'] = numberOfPlayers['redMafia']! + 1;
        break;
    }
    numberOfPlayers['total'] = calcTotalPlayers();
  }

  void removePlayerFromCount(Fraction fraction) {
    int calcTotalPlayers() {
      return numberOfPlayers['mafia']! +
          numberOfPlayers['townsfolk']! +
          numberOfPlayers['sindicate']! +
          numberOfPlayers['redMafia']!;
    }

    switch (fraction) {
      case Fraction.mafia:
        if (numberOfPlayers['mafia']! > 0) {
          numberOfPlayers['mafia'] = numberOfPlayers['mafia']! - 1;
        }
        break;
      case Fraction.townsfolk:
        if (numberOfPlayers['townsfolk']! > 0) {
          numberOfPlayers['townsfolk'] = numberOfPlayers['townsfolk']! - 1;
        }
        break;
      case Fraction.sindicate:
        if (numberOfPlayers['sindicate']! > 0) {
          numberOfPlayers['sindicate'] = numberOfPlayers['sindicate']! - 1;
        }
        break;
      case Fraction.redMafia:
        if (numberOfPlayers['redMafia']! > 0) {
          numberOfPlayers['redMafia'] = numberOfPlayers['redMafia']! - 1;
        }
        break;
    }
    numberOfPlayers['total'] = calcTotalPlayers();
  }

  void addPlayerWithName(String playerName) {
    // get next free id from players
    final id = (int.parse(players.last.id) + 1).toString();

    players.add(Player(id: id, name: playerName, device: Device.main));
  }
}

class Player {
  String id;
  String name;
  Character? character;
  Device device;

  Player({
    required this.id,
    required this.name,
    this.character,
    required this.device,
  });
}
