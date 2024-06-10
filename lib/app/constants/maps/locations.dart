import '../../data/location/models/location.dart';

Map<String, Location> locationMap = {
  'harbor': Location(
    id: '1',
    name: 'Port',
    description:
        'Port to miejsce, w którym spotykają się wszyscy mieszkańcy miasta. To tutaj odbywają się najważniejsze wydarzenia, a także to stąd wypływają statki handlowe i rybackie. Port jest sercem miasta, łączącym je z resztą świata.',
    imagePath: 'assets/images/locations/harbor.jpg',
  ),
  'police': Location(
    id: '2',
    name: 'Posterunek Policji',
    description:
        'Posterunek Policji to miejsce, w którym funkcjonariusze dbają o porządek i bezpieczeństwo mieszkańców miasta. To tutaj zgłasza się wszelkie przestępstwa, a także to stąd wyruszają patrole, by zapewnić bezpieczeństwo mieszkańcom.',
    imagePath: 'assets/images/locations/police.jpg',
  ),
  'court': Location(
    id: '3',
    name: 'Sąd',
    description:
        'Sąd to miejsce, w którym rozstrzygane są wszelkie spory i konflikty między mieszkańcami miasta. To tutaj odbywają się procesy, a także to stąd wydawane są wyroki. Sąd jest miejscem sprawiedliwości, które dba o przestrzeganie prawa.',
    imagePath: 'assets/images/locations/court.jpg',
  ),
  'warehouse': Location(
    id: '4',
    name: 'Magazyn',
    description:
        'Magazyn to miejsce, w którym przechowywane są wszelkie towary i produkty miasta. To tutaj składowane są zapasy żywności, narzędzi i materiałów budowlanych. Magazyn jest sercem gospodarki miasta, zapewniającym mieszkańcom dostęp do niezbędnych zasobów.',
    imagePath: 'assets/images/locations/warehouse.jpg',
  ),
  'hospital': Location(
    id: '5',
    name: 'Szpital',
    description:
        'Szpital to miejsce, w którym leczeni są wszyscy mieszkańcy miasta. To tutaj udzielana jest pomoc medyczna, a także to stąd wyruszają karetki, by ratować życie poszkodowanych. Szpital jest miejscem zdrowia, które dba o dobrostan mieszkańców.',
    imagePath: 'assets/images/locations/hospital.jpg',
  ),
};
