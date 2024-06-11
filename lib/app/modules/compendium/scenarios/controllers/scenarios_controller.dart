import 'package:get/get.dart';

class ScenariosController extends GetxController {
  //TODO: Implement ScenariosController

  final scenarios = {
    'scenario1': Scenario(
        title: 'Zimna Wojna',
        subtitle: 'Wojna szpiegów',
        scenarioDescription: 'This is a description of scenario1',
        isEighteenPlus: true,
        imagePath: 'assets/images/scenarios/cold_war.jpg',
        description: {
          'wstęp': 'Blablabla',
          'Kontekst historyczny': 'This is a description of scenario1',
          'description3': 'This is a description of scenario1',
        },
        additionalInfo: {
          'location': 'Warszawa',
          'year': '1960',
        }),
    'scenario2': Scenario(
      title: 'Na Krawędzi Świata',
      subtitle: 'Na dzikim zachodzie',
      scenarioDescription: 'This is a description of scenario2',
      isEighteenPlus: true,
      description: {
        'description1': 'This is a description of scenario2',
        'description2': 'This is a description of scenario2',
        'description3': 'This is a description of scenario2',
      },
    ),
    'scenario3': Scenario(
      title: 'Subnautica',
      subtitle: 'Podwodny świat',
      scenarioDescription: 'This is a description of scenario3',
      description: {
        'description1': 'This is a description of scenario3',
        'description2': 'This is a description of scenario3',
        'description3': 'This is a description of scenario3',
      },
    ),
    'scenario4': Scenario(
      title: 'Władca Pierścieni',
      scenarioDescription: '',
      description: {
        'description1': 'This is a description of scenario4',
        'description2': 'This is a description of scenario4',
        'description3': 'This is a description of scenario4',
      },
    ),
    'scenario5': Scenario(
      title: 'Czarny Las',
      subtitle: 'Mroczne zakątki',
      scenarioDescription: 'This is a description of scenario5',
      isEighteenPlus: true,
      description: {
        'description1': 'This is a description of scenario5',
        'description2': 'This is a description of scenario5',
        'description3': 'This is a description of scenario5',
      },
    ),
    'scenario6': Scenario(
      title: 'Policjanci i złodziejaszki',
      scenarioDescription: '',
      description: {
        'description1': 'This is a description of scenario5',
        'description2': 'This is a description of scenario5',
        'description3': 'This is a description of scenario5',
      },
    ),
  };
}

class Scenario {
  final String title;
  final String? subtitle;
  final String scenarioDescription;
  final String imagePath;
  final Map<String, String> description;
  final Map<String, String> additionalInfo;

  final bool isEighteenPlus;

  Scenario({
    required this.title,
    this.subtitle,
    this.imagePath = '',
    required this.scenarioDescription,
    required this.description,
    this.isEighteenPlus = false,
    this.additionalInfo = const {},
  });
}
