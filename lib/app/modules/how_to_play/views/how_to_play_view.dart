import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:get/get.dart';
import 'package:project/app/shared/widgets/loading_indicator_widget.dart';

import '../../../data/tutorial/models/chapter.dart';
import '../controllers/how_to_play_controller.dart';

class HowToPlayView extends GetView<HowToPlayController> {
  const HowToPlayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HowToPlayView'.tr),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) => PageView(
          children: [
            // for (var chapter in controller.tutorial!.chapters)
            //   ChapterWidget(chapter: chapter)
            for (var chapter in howToPlayText)
              ChapterWidget(
                  chapter: Chapter(label: '', text: ''), text: chapter),
          ],
        ),
        onLoading: const LoadingIndicatorWidget(),
      ),
    );
  }
}

class ChapterWidget extends StatelessWidget {
  final Color colorFilter;
  final double colorOpacity;
  final Chapter chapter;
  final String imagePath;

  final String text;

  const ChapterWidget({
    super.key,
    this.colorFilter = Colors.black,
    this.colorOpacity = 0.8,
    required this.chapter,
    this.imagePath = 'assets/images/cubes.jpg',
    this.text = 'Insert emoji hereee😀',
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
          decoration: const BoxDecoration(
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
          padding: EdgeInsets.all(8.0),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       chapter.label,
          //       style: TextStyle(fontSize: 32),
          //       textAlign: TextAlign.left,
          //     ),
          //     Text(
          //       chapter.text,
          //       textAlign: TextAlign.justify,
          //     )
          //   ],
          // ),
          child: Markdown(
            data: text,
            // data: "## Siema\n"
            //     "**To** jest testowy tekst markdown",
          ),
        ),
      ],
    );
  }
}

List<String> howToPlayText = [
  "#### Cel Gry\n"
      "Celem gry Mafia jest odkrycie, kto jest członkiem mafii (i ich eliminacja) zanim mafia wyeliminuje wszystkich niewinnych mieszkańców miasteczka.\n"
      "#### Przygotowanie do Gry\n"
      "1. **Gracze**: Gra wymaga co najmniej 7 graczy, ale im więcej, tym lepiej.\n"
      "2. **Karty Ról**: Przygotuj karty ról. W standardowej wersji gry potrzebujesz karty dla:\n"
      "   - Mieszkańców (większość graczy)\n"
      "   - Mafiosi (2-4 osoby w zależności od liczby graczy)\n"
      "   - Policjant (1 osoba)\n"
      "   - Doktor (1 osoba)\n"
      "   - Opcjonalne role: np. Sędzia, Strażnik, Detektyw\n"
      "3. **Rozdanie Ról**: Każdy gracz losuje jedną kartę roli, którą trzyma w tajemnicy przed innymi graczami.\n",
  "#### Przebieg Gry\n"
      "Gra jest podzielona na rundy, które składają się z dwóch faz: nocy i dnia.\n"
      "#### Faza Nocy\n"
      "1. **Zamknięcie oczu**: Wszyscy gracze zamykają oczy.\n"
      "2. **Mafia budzi się**: Prowadzący prosi mafię o otwarcie oczu i wybranie jednej osoby do eliminacji. Mafia wskazuje ofiarę w ciszy.\n"
      "3. **Mafia zasypia**: Mafia zamyka oczy.\n"
      "4. **Policjant budzi się**: Prowadzący prosi policjanta o otwarcie oczu i wskazanie jednej osoby do sprawdzenia. Prowadzący kiwaniem głowy potwierdza lub zaprzecza, czy dana osoba jest w mafii.\n"
      "5. **Policjant zasypia**: Policjant zamyka oczy.\n"
      "6. **Doktor budzi się**: Prowadzący prosi doktora o otwarcie oczu i wskazanie jednej osoby do ochrony przed atakiem mafii.\n"
      "7. **Doktor zasypia**: Doktor zamyka oczy.\n"
      "#### Faza Dnia\n"
      "1. **Budzenie się**: Wszyscy gracze otwierają oczy.\n"
      "2. **Ogłoszenie ofiar**: Prowadzący ogłasza, kto został zaatakowany przez mafię w nocy. Jeśli doktor uratował tę osobę, prowadzący ogłasza, że nikt nie zginął.\n"
      "3. **Dyskusja**: Gracze dyskutują i dzielą się podejrzeniami. Celem jest odkrycie, kto jest członkiem mafii.\n"
      "4. **Głosowanie**: Gracze głosują, kto ich zdaniem jest mafiosem. Osoba z największą liczbą głosów zostaje wyeliminowana z gry i ujawnia swoją rolę.\n"
      "#### Zakończenie Gry\n"
      "Gra toczy się do momentu, aż jedna ze stron osiągnie swój cel:\n"
      "- **Mafia**: Mafia wygrywa, gdy liczba mafiosów jest równa lub większa od liczby pozostałych graczy.\n"
      "- **Mieszkańcy**: Mieszkańcy wygrywają, gdy wszyscy mafiosi zostaną wyeliminowani.\n",
  "#### Rady i Strategie\n"
      "1. **Blef i manipulacja**: Zarówno mieszkańcy, jak i mafiosi muszą umiejętnie blefować, aby przekonać innych do swojej niewinności.\n"
      "2. **Obserwacja**: Zwracaj uwagę na zachowanie innych graczy. Czy ktoś unika wzroku? Czy ktoś za dużo mówi?\n"
      "3. **Koalicje**: Twórz sojusze z graczami, którym ufasz, ale pamiętaj, że nie zawsze możesz być pewny ich lojalności.\n"
      "4. **Kreatywność**: Wymyślaj przekonujące historie i argumenty, aby zyskać zaufanie innych.\n"
      "Gra Mafia to emocjonująca mieszanka strategii, dedukcji i blefu. Każda rozgrywka jest inna, co sprawia, że gra nigdy się nie nudzi. Powodzenia!\n"
];
