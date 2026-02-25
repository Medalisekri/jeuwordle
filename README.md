Birdle

Un jeu de type **Wordle** développé avec **Flutter** et **Dart**, 
où le joueur doit deviner un mot de 5 lettres en un nombre limité d'essais.

* Fonctionnalités :

-  Lettres bien placées affichées en **vert**
-  Lettres présentes mais mal placées affichées en **jaune**
-  Lettres absentes affichées en **gris**
-  Mot à deviner choisi **aléatoirement** parmi une liste de mots légaux
-  Nombre d'essais configurable (5 par défaut)


* Technologies utilisées :

- Langage : Dart
- Framework UI : Flutter & Material 3
- Architecture : Séparation logique métier (`game.dart`) / UI (`main.dart`)

* Comment ça fonctionne ?

1. Un mot de 5 lettres est sélectionné aléatoirement
2. Le joueur soumet des mots de 5 lettres
3. Chaque lettre est colorée selon le résultat :
   - **Vert** : bonne lettre, bonne position
   - **Jaune** : bonne lettre, mauvaise position
   - **Gris** : lettre absente du mot

## Structure du projet
```
lib/
├── main.dart        # Interface utilisateur (Widgets Flutter)
└── game.dart        # Logique métier du jeu (Game, Word, HitType)
```

* Architecture :

* Logique métier (`game.dart`) :

| Classe / Type | Description |
|---|---|
| `Game` | Gère l'état d'une partie (mot caché, essais, victoire/défaite) |
| `Word` | Représente un mot avec ses lettres et leur résultat |
| `HitType` | Enum : `hit`, `partial`, `miss`, `none`, `removed` |
| `Letter` | Record contenant un caractère et son `HitType` |

* Interface (`main.dart`) :

| Widget | Description |
|---|---|
| `MainApp` | Point d'entrée de l'application |
| `GamePage` | Affiche la grille de jeu |
| `Tile` | Tuile individuelle affichant une lettre et sa couleur |

* Captures d'écran :
  <img width="1920" height="1080" alt="Screenshot (150)" src="https://github.com/user-attachments/assets/90e29b8a-541c-40be-84f6-feffb74803ba" />
  
  <img width="1920" height="1080" alt="Screenshot (152)" src="https://github.com/user-attachments/assets/731a3a8a-6f4b-4d47-b013-52c945de4179" />
  
<img width="1920" height="1080" alt="Screenshot (153)" src="https://github.com/user-attachments/assets/68bcbcc7-9c43-43c2-b269-a05d81ddc5b1" />

<img width="1920" height="1080" alt="Screenshot (154)" src="https://github.com/user-attachments/assets/899bc50a-a57f-431b-8419-da41a569aff3" />


<img width="1920" height="1080" alt="Screenshot (149)" src="https://github.com/user-attachments/assets/5fded2ae-c32c-47f2-af4f-380995e620ae" />


