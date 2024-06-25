import 'package:get/get.dart';

class ScenariosController extends GetxController {
  final scenarios = {
    'scenario1': Scenario(
        title: 'Zimna Wojna',
        subtitle: 'Wojna szpiegów',
        scenarioDescription: 'This is a description of scenario1',
        isEighteenPlus: true,
        imagePath: 'assets/images/scenarios/cold_war.jpg',
        description: {
          'Tło fabularne':
              'Jest rok 1963. Świat znajduje się w szczytowym okresie zimnej wojny. W małym europejskim miasteczku, którego strategiczne położenie sprawia, że jest ono polem działania zarówno agentów KGB, jak i CIA, życie toczy się pozornie normalnie. Jednak pod powierzchnią spokojnego życia mieszkańców kryje się intensywna szpiegowska działalność.',
          'Scenariusz gry':
              'Gra zaczyna się, gdy w mieście zostaje znalezione ciało wysoko postawionego naukowca pracującego nad tajnym projektem wojskowym. Władze są pewne, że w grę wchodzi szpiegostwo i zdrada. Gracze wcielają się w role mieszkańców, agentów CIA, agentów KGB oraz niewinnych obywateli, którzy muszą odkryć, kto jest zdrajcą i jakie są jego prawdziwe motywy.',
          'Przebieg gry':
              'Gra podzielona jest na noce i dni. W nocy agenci KGB decydują, kogo chcą zlikwidować, oficer CIA przesłuchuje, agent CIA chroni, a doktor ratuje. W ciągu dnia gracze dyskutują i głosują, kto ich zdaniem jest agentem KGB. Osoba z największą liczbą głosów zostaje aresztowana lub stracona. Gra toczy się do momentu, aż jedna ze stron osiągnie swój cel.',
          'Epilog':
              'Jeśli KGB wygra, miasteczko stanie się strategicznym punktem operacyjnym dla Związku Radzieckiego, co może zmienić bieg zimnej wojny. Jeśli mieszkańcy i agenci CIA wygrają, miasteczko odzyska spokój, a tajne informacje zostaną bezpiecznie przekazane stronie amerykańskiej, wzmacniając ich pozycję w globalnym konflikcie.',
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
