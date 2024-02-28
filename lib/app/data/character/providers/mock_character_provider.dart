import '../../../constants/enums/fraction.dart';
import '../models/character.dart';
import 'character_provider.dart';

class MockCharacterProvider implements CharacterProvider {
  @override
  Future<Character> fetchCharacter(String id) async {
    Future.delayed(const Duration(seconds: 1));
    return Character(
      id: 'bla',
      name: 'Członek Mafii',
      description:
          'Zadaniem członka mafii jest wyeliminowanie wszystkich członków miasteczka.',
      story: 'Skyty w cieniu, członek mafii czeka na swoją ofiarę.',
      quote: 'Ktoś zginie tej nocy...',
      fraction: Fraction.mafia,
      additionalInfo: {
        'Zdolność specjalna': true,
        'Zdolność specjalna 2': false,
      },
      howToPlay: [
        'Zabij wszystkich członków miasteczka.',
        'Zabij wszystkich członków miasteczka.',
        'Zabij wszystkich członków miasteczka.',
      ],
      otherNames: [
        'Mafia',
        'Mafiozo',
        'Mafijny boss',
      ],
      imagePath: 'assets/images/characters/mafiaCharacter.jpg',
      rate: {},
    );
  }

  @override
  Future<List<Character>> fetchAllCharacters() async {
    return List<Character>.generate(
      10,
      (index) => Character(
          id: 'vla',
          name: 'Mock Character $index',
          description: 'This is mock character $index',
          story: 'This character has a mock story',
          quote: 'This character has a mock quote',
          fraction: index % 2 == 0 ? Fraction.mafia : Fraction.townsfolk,
          additionalInfo: {
            'Mock info': true,
            'Mock info 2': false,
          },
          howToPlay: [
            'Mock how to play 1',
            'Mock how to play 2',
            'Mock how to play 3',
          ],
          otherNames: [
            'Mock name 1',
            'Mock name 2',
            'Mock name 3',
          ],
          imagePath: 'assets/images/characters/mafiaCharacter.jpg',
          rate: {}),
    );
  }

  @override
  Future<void> updateCharacter(Character character) async {
    // In a mock provider, this method might do nothing.
  }

  @override
  Future<void> deleteCharacter(String id) async {
    // In a mock provider, this method might do nothing.
  }
}
