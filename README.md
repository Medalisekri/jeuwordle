# Birdle 

Un jeu de type **Wordle** interactif développé avec **Flutter** et **Dart**,
avec saisie clavier, animations et gestion complète de partie.

## Fonctionnalités

-  Saisie du mot via un **champ texte** et validation par bouton ou touche Entrée
-  Lettres bien placées en **vert**
-  Lettres présentes mais mal placées en **jaune**
-  Lettres absentes en **gris**
-  **Animations** sur les tuiles (`AnimatedContainer`) et le bouton Rejouer (`AnimatedSwitcher`)
-  Message de **victoire ou défaite** en fin de partie
-  Bouton **Rejouer** avec animation de fondu et glissement


## Technologies utilisées

- **Langage :** Dart
- **Framework UI :** Flutter & Material 3
- **Architecture :** `StatefulWidget` avec séparation logique métier / UI

## Comment ça fonctionne ?

1. Un mot de 5 lettres est sélectionné aléatoirement
2. Tapez un mot de 5 lettres dans le champ de saisie
3. Appuyez sur **Entrée** ou sur l'icône **↑** pour valider
4. Chaque lettre est colorée selon le résultat :
   -  **Vert** : bonne lettre, bonne position
   -  **Jaune** : bonne lettre, mauvaise position
   -  **Gris** : lettre absente du mot
5. Gagnez en trouvant le mot en **5 essais maximum**

## Structure du projet
```
lib/
├── main.dart        # Interface utilisateur (Widgets Flutter)
└── game.dart        # Logique métier (Game, Word, HitType)
```

## Architecture

### Logique métier (`game.dart`)

| Classe / Type | Description |
|---|---|
| `Game` | Gère l'état complet d'une partie |
| `Word` | Représente un mot avec ses lettres évaluées |
| `HitType` | Enum : `hit`, `partial`, `miss`, `none`, `removed` |
| `Letter` | Record `{char, type}` pour chaque lettre |

### Interface (`main.dart`)

| Widget | Description |
|---|---|
| `MainApp` | Point d'entrée de l'application |
| `GamePage` | `StatefulWidget` gérant l'état de la partie |
| `GuessInput` | Champ de saisie avec bouton de validation |
| `Tile` | Tuile animée affichant une lettre et sa couleur |

## Animations

| Animation | Description |
|---|---|
| `AnimatedContainer` | Transition de couleur fluide sur chaque tuile |
| `AnimatedSwitcher` | Fondu + glissement sur le bouton Rejouer |
| `FadeTransition` | Fondu enchaîné |
| `SlideTransition` | Glissement depuis le bas |

* DevTools & Débogage :

Ce projet est compatible avec **Flutter DevTools** pour faciliter le débogage et l'inspection de l'interface.

* Lancer DevTools :

```bash

flutter run --debug

```

Puis dans le terminal, appuyez sur **`d`** pour ouvrir DevTools dans le navigateur.
* Captures d'ecran : 
<img width="1920" height="1080" alt="Screenshot (177)" src="https://github.com/user-attachments/assets/08869195-f724-4bfb-8da7-02e4bd934915" />
<img width="1920" height="1080" alt="Screenshot (178)" src="https://github.com/user-attachments/assets/95e91b06-3741-4474-93a5-3839175456ac" />

<img width="1559" height="1080" alt="Screenshot (153)" src="https://github.com/user-attachments/assets/33297e41-ee2c-4d25-b36c-d8fc3853a40e" />
<img width="1541" height="1080" alt="Screenshot (154)" src="https://github.com/user-attachments/assets/9103e140-e0a8-4dc5-8392-025fcb82ca29" />

<img width="1920" height="1080" alt="Screenshot (158)" src="https://github.com/user-attachments/assets/81453b67-5020-4fdb-84e5-65cd3f0e9853" />

<img width="1920" height="1080" alt="Screenshot (174)" src="https://github.com/user-attachments/assets/b0e990b7-8948-4f31-b9b1-df0e1fee7954" />

<img width="1920" height="1080" alt="Screenshot (175)" src="https://github.com/user-attachments/assets/226d6d0d-a2d8-47c5-8c9b-29ae13c60196" />

