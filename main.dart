import 'package:flutter/material.dart';
import 'game.dart';

void main() {
  runApp(const MainApp());
}
class Tile extends StatelessWidget {
const Tile(this.letter, this.hitType, {super.key});
final String letter;
final HitType hitType;
@override
Widget build(BuildContext context) {
return AnimatedContainer(
duration: const Duration(milliseconds: 400),
curve: Curves.easeIn,
height: 60,
width: 60,
decoration: BoxDecoration(
border: Border.all(
color: hitType == HitType.none
? Colors.grey.shade300
: Colors.transparent,
),
borderRadius: BorderRadius.circular(4),
color: switch (hitType) {
HitType.hit => Colors.green.shade600,
HitType.partial => Colors.amber.shade600,
HitType.miss => Colors.grey.shade600,
_ => Colors.white,
},
),
child: Center(
child: Text(
letter.toUpperCase(),
style: Theme.of(context).textTheme.titleLarge?.copyWith(
color: hitType == HitType.none ? Colors.black : Colors.white,
fontWeight: FontWeight.bold,
),
),
),
);
}
}
class MainApp extends StatelessWidget {
const MainApp({super.key});
@override
Widget build(BuildContext context) {
return MaterialApp(
home: Scaffold(
appBar: AppBar( // Ajout de l'AppBar
title: Align(
alignment: Alignment.centerLeft, // Titre aligné à gauche
child: Text('Birdle'),
),
),
body: Center(child: GamePage()), // Inchangé pour l'instant
),
);
}
}
class GamePage extends StatefulWidget {
GamePage({super.key});
@override
State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
late Game _game;

@override
void initState() {
  super.initState();
  _game = Game();
}

@override
Widget build(BuildContext context) {
return Padding(
padding: const EdgeInsets.all(8.0),
child: Column(
spacing: 5.0,
children: [
  AnimatedSwitcher(
duration: Duration(milliseconds: 400),
transitionBuilder: (child, animation) {
return FadeTransition( // fondu enchaîné par défaut
opacity: animation,
child: SlideTransition( // + glissement vers le haut
position: Tween<Offset>(
begin: Offset(0, 0.3), // part de 30% en dessous
end: Offset.zero,
).animate(animation),
child: child,
),
);
},
child: _game.isGameOver
? ElevatedButton(
key: ValueKey('replay'), // ← Key obligatoire pour AnimatedSwitcher
onPressed: () {
setState(() {
_game = Game(); // Réinitialise le jeu
});
},
child: Text('Rejouer'),
)
: SizedBox.shrink(key: ValueKey('empty')), // widget invisible
),
for (var guess in _game.guesses)
Row(
spacing: 5.0,
children: [
for (var letter in guess)
Tile(letter.char, letter.type),
],
),
GuessInput(
onSubmitGuess: (String guess) {
setState(() { // ← NOUVEAU : notifie Flutter
_game.guess(guess); // ← modifie l'état à l'intérieur
});
},
),
if (_game.isGameOver)
Padding(
padding: const EdgeInsets.all(16.0),
child: Text(
_game.isWon
? 'Bravo ! Vous avez trouvé le mot !'
: 'Perdu ! Le mot était : ${_game.targetWord}',
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
color: _game.isWon ? Colors.green : Colors.red,
),
),
),
],
),
);
}
}

class GuessInput extends StatefulWidget {
  const GuessInput({super.key, required this.onSubmitGuess});
  final void Function(String) onSubmitGuess;

  @override
  State<GuessInput> createState() => _GuessInputState();
}

class _GuessInputState extends State<GuessInput> {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onSubmit() {
    final texte = _textEditingController.text.trim();
    if (texte.length == 5) {
      widget.onSubmitGuess(texte);
      _textEditingController.clear();
      _focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLength: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                ),
              ),
              controller: _textEditingController,
              autofocus: true,
              focusNode: _focusNode,
              onSubmitted: (_) {
                _onSubmit();
              },
            ),
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.arrow_circle_up),
          onPressed: _onSubmit,
        ),
      ],
    );
  }
}