import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HowToPlayMenuController extends GetxController {
  Tutorial tutorial = Tutorial(
    id: "tutorial_pl_PL",
    language: "pl_PL",
    sections: [
      Section(
        title: "Informacje ogólne",
        subtitle: "Podstawowe zasady gry Mafia",
        icon: Icons.info_outline,
        imagePath: 'assets/images/howToPlay/general-info.webp',
        subSections: [
          SubSection(
              title: "Cel gry",
              data:
                  "Mafia to towarzyska gra fabularna, która polega na dedukcji i strategii. Gracze wcielają się w role mieszkańców małego miasteczka, które zostało opanowane przez mafię. Gra toczy się w rundach, a każda runda składa się z fazy dnia i nocy. Celem gry jest eliminacja przeciwników swojej frakcji."),
          SubSection(title: "Przebieg gry", data: """
Gra toczy się w rundach składających się z dwóch faz:

**Noc:**
1. Narrator ogłasza początek nocy i wszyscy gracze zamykają oczy.
2. **Mafia**: Mafię prosi się o otworzenie oczu i wspólne wybranie ofiary na eliminację. Następnie mafia zamyka oczy.
3. **Policjant (Detektyw)**: Policjant otwiera oczy i wskazuje jednego gracza do sprawdzenia. Narrator pokazuje, czy wskazany gracz jest mafią.
4. **Lekarz**: Lekarz otwiera oczy i wybiera jednego gracza do ochrony przed atakiem mafii. Lekarz zamyka oczy.
5. Narrator ogłasza koniec nocy i wszyscy gracze otwierają oczy.

**Dzień:**
1. Narrator ogłasza, kto został wyeliminowany przez mafię, jeśli lekarz nie ochronił tej osoby.
2. Gracze dyskutują i próbują ustalić, kto należy do mafii.
3. **Głosowanie**: Po dyskusji gracze głosują na jednego gracza, który ma zostać wyeliminowany. Osoba z największą liczbą głosów opuszcza grę.
4. Gra przechodzi do kolejnej nocy.
"""),
          SubSection(title: "Postacie i Frakcje", data: """#### Postacie
- **Mafia**: Członkowie mafii znają swoje tożsamości i wspólnie eliminują niewinnych mieszkańców.
- **Mieszkańcy (Niewinni)**: Starają się zidentyfikować i wyeliminować mafię.
- **Policjant (Detektyw)**: Każdej nocy może sprawdzić tożsamość jednego gracza.
- **Lekarz**: Każdej nocy może ochronić jednego gracza przed atakiem mafii.

#### Frakcje
- **Mafia**: Złożona z kilku graczy (w zależności od liczby uczestników), ich celem jest eliminacja wszystkich niewinnych mieszkańców.
- **Mieszkańcy (Niewinni)**: Reszta graczy, ich celem jest zdemaskowanie i wyeliminowanie mafii."""),
        ],
      ),
      Section(
        title: "Faza nocy",
        subtitle: "Faza nocy w grze Mafia",
        icon: Icons.nights_stay_outlined,
        imagePath: 'assets/images/howToPlay/night-phase.webp',
        subSections: [
          SubSection(title: "Zerowa noc", data: """**Zerowa Noc:**
Narrator ogłasza początek zerowej nocy i wszyscy gracze zamykają oczy. W zerowej nocy mogą wystąpić wstępne interakcje lub przydzielanie ról przez narratora.
"""),
          SubSection(
              title: "Aktywność wybranej postaci",
              data: """**Aktywność Wybranych Postaci:**
1. **Mafia**: Narrator prosi mafię o otworzenie oczu i wspólne wybranie ofiary na eliminację. Następnie mafia zamyka oczy.
2. **Policjant (Detektyw)**: Policjant otwiera oczy i wskazuje jednego gracza do sprawdzenia. Narrator pokazuje, czy wskazany gracz jest mafią.
3. **Lekarz**: Lekarz otwiera oczy i wybiera jednego gracza do ochrony przed atakiem mafii. Lekarz zamyka oczy.
4. Narrator ogłasza koniec nocy i wszyscy gracze otwierają oczy.
"""),
        ],
      ),
      Section(
        title: "Faza dnia",
        subtitle: "Faza dnia w grze Mafia",
        icon: Icons.wb_sunny_outlined,
        imagePath: 'assets/images/howToPlay/day-phase.webp',
        subSections: [
          SubSection(title: "Przebieg dnia", data: """
1. Narrator ogłasza, kto został wyeliminowany przez mafię, jeśli lekarz nie ochronił tej osoby.
2. Gracze dyskutują i próbują ustalić, kto należy do mafii."""),
          SubSection(title: "Prognoza pogody", data: """**Prognoza Pogody:**
Narrator może wprowadzić dodatkowy element gry, jakim jest prognoza pogody, która może wpływać na przebieg dnia i decyzje graczy. Na przykład, burzowa pogoda może ograniczyć liczbę interakcji między graczami.
"""),
          SubSection(title: "Głosowanie zabijanie czy sprawdzanie", data: """
Gracze decydują, czy chcą kogoś wyeliminować (zabijanie) poprzez głosowanie, czy sprawdzić czyjąś tożsamość za pomocą specjalnej umiejętności (sprawdzanie), jeśli taka opcja jest dostępna. Po dyskusji gracze głosują na jednego gracza, który ma zostać wyeliminowany. Osoba z największą liczbą głosów opuszcza grę.
"""),
          SubSection(
              title: "Pojedynek",
              data:
                  """Gracz w każdej chwili w trakcie dnia może wyzwać innego gracza na pojedynek."""),
        ],
      ),
      Section(
        title: "Zakończenie gry",
        subtitle: "Zakończenie gry w grze Mafia",
        icon: Icons.flag_outlined,
        imagePath: 'assets/images/howToPlay/end-game.webp',
        subSections: [
          SubSection(title: "Zakończenie gry", data: """

Gra kończy się, gdy jedna z grup osiągnie swój cel:

- **Mafia** wygrywa, gdy liczba członków mafii jest równa lub większa niż liczba niewinnych mieszkańców.
- **Mieszkańcy** wygrywają, gdy wszystkie osoby z mafii zostaną wyeliminowane.

Narrator ogłasza zakończenie gry i zwycięską frakcję. Następnie wszyscy gracze mogą ujawnić swoje role i omówić przebieg gry.
""")
        ],
      ),
    ],
  );
}

class Tutorial {
  final String id;
  final String language;
  final List<Section> sections;

  Tutorial({
    required this.id,
    required this.language,
    required this.sections,
  });
}

class Section {
  final String title;
  final String subtitle;
  final String imagePath;
  final IconData? icon;
  final List<SubSection> subSections;

  Section({
    required this.title,
    required this.subtitle,
    this.imagePath = 'assets/images/main_menu/how_to_play.jpg',
    this.icon,
    required this.subSections,
  });
}

class SubSection {
  final String title;
  final String data;
  final String? imagePath;

  SubSection({
    required this.title,
    required this.data,
    this.imagePath,
  });
}
