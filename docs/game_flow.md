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
