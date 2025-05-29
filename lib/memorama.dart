import 'package:flutter/material.dart';
import 'dart:math';

class MemoramaScreen extends StatefulWidget {
  const MemoramaScreen({super.key});

  @override
  State<MemoramaScreen> createState() => _MemoramaScreenState();
}

class _MemoramaScreenState extends State<MemoramaScreen> {
  final List<String> emojis = ['🍎', '🍌', '🍇', '🍓', '🍍', '🥝'];

  late List<String> cards;
  List<bool> revealed = [];
  int? firstIndex;
  int? secondIndex;
  bool lockBoard = false;

  @override
  void initState() {
    super.initState();
    resetGame();
  }

  void resetGame() {
    cards = List.from(emojis)..addAll(emojis);
    cards.shuffle(Random());
    revealed = List.filled(cards.length, false);
    firstIndex = null;
    secondIndex = null;
    lockBoard = false;
    setState(() {});
  }

  void onCardTap(int index) {
    if (lockBoard || revealed[index]) return;

    setState(() {
      if (firstIndex == null) {
        firstIndex = index;
      } else {
        secondIndex = index;
        lockBoard = true;

        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            if (cards[firstIndex!] == cards[secondIndex!]) {
              revealed[firstIndex!] = true;
              revealed[secondIndex!] = true;
            }
            firstIndex = null;
            secondIndex = null;
            lockBoard = false;
          });
        });
      }
    });
  }

  bool get allRevealed => revealed.every((element) => element);

  void showPasswordDialog() {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ingrese contraseña para regresar'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(hintText: 'Contraseña'),
          obscureText: true,
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (controller.text == '128') {
                Navigator.pop(context); // Cierra el dialog
                Navigator.pop(context); // Regresa a la pantalla anterior
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Contraseña incorrecta')),
                );
              }
            },
            child: const Text('Aceptar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: showPasswordDialog,
                  ),
                  const Expanded(
                    child: Text(
                      'Memorama para Adultos Mayores',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            if (allRevealed)
              Column(
                children: [
                  const Icon(Icons.celebration, size: 80, color: Colors.orange),
                  const Text(
                    '¡Felicidades, encontraste todas las parejas!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: resetGame,
                    child: const Text('Jugar de nuevo'),
                  ),
                ],
              ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    final isRevealed =
                        revealed[index] ||
                        index == firstIndex ||
                        index == secondIndex;
                    return GestureDetector(
                      onTap: () => onCardTap(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          color: isRevealed
                              ? Colors.white
                              : Colors.blue.shade300,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.black26),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          isRevealed ? cards[index] : '?',
                          style: const TextStyle(fontSize: 36),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
