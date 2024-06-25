# Przebieg rozgrywki

```mermaid
flowchart LR

Wprowadzenie --> A
A(Noc 0) --> B(Dzień 0)
B --> C(Faza nocy)
C --> D(Faza dnia)
D --> C
D -.-> E
C -.-> E(Koniec gry)
```
### views
```mermaid

flowchart
subgraph GameSetup
GS(GameSetupView)
end
GS-- setupGame() --> CV(CardView)
subgraph DayAndNightZero
CV --> CV
CV --> MFW(MasterFirstView)
MFW --> MNZV(MasterNightZeroView)
MNZV --> MDZV(MasterDayZeroView)
end
subgraph DayAndNight
MDZV --> NV(NightView)
NV --> DV(DayView)
DV --> NV
end

subgraph GameOver
DV-- gameOver() --> GameOverView
NV-- gameOver() --> GameOverView
GameOverView --> SummaryStoryView
end

DayAndNight --> MasterView
```

**GameSetupView** - Ustawienie gry, czyli:
- wybór czy gra jest online
- wybór ilości graczy, osób w frakcjach
- wyświetlanie listy graczy
- wyświetlanie listy postaci

Następnie wywołanie metody `setupGame()`, w tym sprawdzić, czy wszystko zostało dobrze ustawione:
- czy w grze są wybrane frakcje *miasto* i *mafia*
- czy liczba graczy jest zgodna z liczbą postaci
- czy liczba postaci jest zgodna z liczbą przy frakcji

**CardView** - wyświetlenie kart postaci dla gracza.






SummaryStoryView - podsumowanie gry w formie wyświetlanej historii
