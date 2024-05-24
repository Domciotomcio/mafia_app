import 'package:get/get.dart';
import 'package:project/app/constants/enums/fraction.dart';
import 'package:project/app/data/character/models/character.dart';
import 'package:project/app/shared/sorting/sort.dart';

import '../../../constants/enums/device.dart';

class GameSetupController extends GetxController {
  var numberOfPlayers = {
    'total': 6,
    'mafia': 2,
    'townsfolk': 4,
    'sindicate': 0,
    'redMafia': 0,
  }.obs;

  var isOfflineMode = false.obs;

  var selectedSegment = 1.obs;

  var players = <Player>[
    Player(
      id: '1',
      name: 'Ala',
      device: Device.main,
    ),
    Player(
      id: '2',
      name: 'Adam',
      device: Device.main,
    ),
    Player(
      id: '3',
      name: 'Grzegorz',
      device: Device.main,
    ),
    Player(
      id: '4',
      name: 'Tomek',
      device: Device.main,
    ),
    Player(
      id: '5',
      name: 'Tola',
      device: Device.main,
    ),
    Player(
      id: '6',
      name: 'Andrzej',
      device: Device.main,
    ),
  ].obs;

  var characters = <Character>[
    const Character(
      id: '1',
      name: 'Szef mafii',
      description: 'Zabij innego gracza',
      story: '',
      quote: '',
      fraction: Fraction.mafia,
      additionalInfo: {},
      howToPlay: [],
      rate: {},
      otherNames: [],
      imagePath: '',
      nameId: 'mafiaLeader',
    ),
    const Character(
        id: '2',
        name: 'Członek miasta',
        description: '',
        story: '',
        quote: '',
        fraction: Fraction.townsfolk,
        additionalInfo: {},
        howToPlay: [],
        rate: {},
        otherNames: [],
        imagePath: '',
        nameId: 'citizen'),
    const Character(
        id: '3',
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
        nameId: 'citizen'),
    const Character(
      id: '4',
      name: 'Katani',
      description: '',
      story: '',
      quote: '',
      fraction: Fraction.townsfolk,
      additionalInfo: {},
      howToPlay: [],
      rate: {},
      otherNames: [],
      imagePath: '',
      nameId: 'cattani',
    ),
    const Character(
      id: '5',
      name: 'Lekarz',
      description: '',
      story: '',
      quote: '',
      fraction: Fraction.townsfolk,
      additionalInfo: {},
      howToPlay: [],
      rate: {},
      otherNames: [],
      imagePath: '',
      nameId: 'doctor',
    ),
    const Character(
      id: '6',
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
      nameId: 'mafiaMember',
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

  bool setupGame() {
    var isOk = (numberOfPlayers['total'] == players.length);

    isOk = isOk && (players.length == characters.length);

    if (isOk) {
      mergePlayersWithCharacters();

      Get.snackbar(
        'Sukces',
        'Gra została poprawnie skonfigurowana',
      );
      Get.toNamed('master');

      return true;
    }
    Get.snackbar(
      'Błąd',
      'Liczba graczy nie zgadza się z ilością wybranych postaci',
    );
    return false;
  }

  void mergePlayersWithCharacters() {
    characters.shuffle();
    for (var i = 0; i < players.length; i++) {
      players[i].character = characters[i];
    }
  }

  void addCharacter(Character player) {
    characters.add(player);
    sortByName(characters);
  }

  void removeCharacter(Character player) {
    characters.remove(player);
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
