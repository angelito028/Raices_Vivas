import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'dart:async';
import 'dart:math';

class SopaDeLetras extends StatefulWidget {
  const SopaDeLetras({super.key});

  @override
  State<SopaDeLetras> createState() => _SopaDeLetrasState();
}

class _SopaDeLetrasState extends State<SopaDeLetras> {
  final List<List<String>> paresDeEmojis = [
    ['😀', '😁'],
    ['😍', '😎'],
    ['🤩', '😜'],
    ['🥰', '😊'],
    ['😆', '😂'],
  ];

  int nivelActual = 0;
  late List<String> emojis;
  List<Color> cardColors = [];
  bool isGameCompleted = false;
  List<int> tiemposPorNivel = [0, 0, 0, 0, 0];

  late Stopwatch stopwatch;
  late Timer timer;
=======
import 'dart:math';

class SopaDeLetrasScreen extends StatefulWidget {
  const SopaDeLetrasScreen({super.key});

  @override
  State<SopaDeLetrasScreen> createState() => _SopaDeLetrasScreenState();
}

class _SopaDeLetrasScreenState extends State<SopaDeLetrasScreen> {
  final int rows = 8;
  final int cols = 8;
  late List<List<String>> grid;
  final List<String> letters = 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ'.split('');
  final List<String> fruits = ['PERA', 'KIWI', 'UVA'];
  final Set<String> foundWords = {};

  List<Offset> selectedCells = [];
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f

  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
    stopwatch = Stopwatch();
    iniciarNivel();
  }

  void iniciarNivel() {
    final par = paresDeEmojis[nivelActual];
    final baseEmoji = par[0];
    final diferente = par[1];
    final indexDiferente = Random().nextInt(16);

    emojis =
        List.generate(16, (i) => i == indexDiferente ? diferente : baseEmoji);
    cardColors = List.filled(emojis.length, Colors.blue.shade200);
    isGameCompleted = false;

    stopwatch.reset();
    stopwatch.start();

    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {});
    });
  }

  void onEmojiTap(int index) {
    if (isGameCompleted) return;

    setState(() {
      final par = paresDeEmojis[nivelActual];
      final diferente = par[1];

      if (emojis[index] == diferente) {
        cardColors[index] = Colors.green;
        stopwatch.stop();
        timer.cancel();
        tiemposPorNivel[nivelActual] = stopwatch.elapsed.inSeconds;

        if (nivelActual < 4) {
          nivelActual++;
          iniciarNivel();
        } else {
          isGameCompleted = true;
        }
      } else {
        cardColors[index] = Colors.red;
      }
    });
  }

  void reiniciarJuego() {
    setState(() {
      nivelActual = 0;
      tiemposPorNivel = [0, 0, 0, 0, 0];
      isGameCompleted = false;
      iniciarNivel();
    });
  }

  void mostrarDialogoSalida() {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController controlador = TextEditingController();
        return AlertDialog(
          title: const Text('Ingrese la contraseña para salir'),
          content: TextField(
            controller: controlador,
            keyboardType: TextInputType.number,
            obscureText: true,
            decoration: const InputDecoration(hintText: 'Contraseña'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (controlador.text == '128') {
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
              },
              child: const Text('Aceptar'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFf5e9dc), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // AppBar personalizado
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFf5e9dc), Color(0xFFf5e9dc)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: mostrarDialogoSalida,
                    ),
                    Expanded(
                      child: Text(
                        'Nivel ${nivelActual + 1}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                        width: 48), // Para equilibrar el botón de atrás
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Encuentra el emoji diferente',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              if (isGameCompleted)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Card(
                        elevation: 5,
                        color: Colors.green.shade300,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            '¡Juego terminado!\n'
                            'Nivel 1: ${tiemposPorNivel[0]} segundos\n'
                            'Nivel 2: ${tiemposPorNivel[1]} segundos\n'
                            'Nivel 3: ${tiemposPorNivel[2]} segundos\n'
                            'Nivel 4: ${tiemposPorNivel[3]} segundos\n'
                            'Nivel 5: ${tiemposPorNivel[4]} segundos',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: reiniciarJuego,
                        icon: const Icon(Icons.replay),
                        label: const Text("Volver a jugar"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              if (!isGameCompleted)
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: emojis.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => onEmojiTap(index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color: cardColors[index],
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.black26),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            emojis[index],
                            style: const TextStyle(fontSize: 30),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
=======
    _generateGrid();
  }

  void _generateGrid() {
    grid = List.generate(rows, (_) => List.generate(cols, (_) => ''));

    for (var word in fruits) {
      bool placed = false;
      while (!placed) {
        int startRow = Random().nextInt(rows);
        int startCol = Random().nextInt(cols - word.length);
        if (startCol + word.length <= cols) {
          bool canPlace = true;
          for (int i = 0; i < word.length; i++) {
            if (grid[startRow][startCol + i] != '') {
              canPlace = false;
              break;
            }
          }
          if (canPlace) {
            for (int i = 0; i < word.length; i++) {
              grid[startRow][startCol + i] = word[i];
            }
            placed = true;
          }
        }
      }
    }

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (grid[i][j] == '') {
          grid[i][j] = (letters.toList()..shuffle()).first;
        }
      }
    }
  }

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
                Navigator.pop(context);
                Navigator.pop(context);
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

  void _checkSelectedWord() {
    String selectedWord = '';
    for (var offset in selectedCells) {
      selectedWord += grid[offset.dy.toInt()][offset.dx.toInt()];
    }
    if (fruits.contains(selectedWord) && !foundWords.contains(selectedWord)) {
      setState(() {
        foundWords.add(selectedWord);
        selectedCells.clear();
      });
    } else {
      setState(() {
        selectedCells.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width / cols * 0.5;

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
                      'Sopa de Letras para Adultos Mayores',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: fruits
                    .map(
                      (word) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 6.0,
                        ),
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 300),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: foundWords.contains(word)
                                ? Colors.green
                                : Colors.black,
                          ),
                          child: Text(word),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: cols,
                    childAspectRatio: 1,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemCount: rows * cols,
                  itemBuilder: (context, index) {
                    final row = index ~/ cols;
                    final col = index % cols;
                    final letter = grid[row][col];
                    final selected = selectedCells.contains(
                      Offset(col.toDouble(), row.toDouble()),
                    );
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCells.add(
                            Offset(col.toDouble(), row.toDouble()),
                          );
                          if (selectedCells.length >= 2) {
                            _checkSelectedWord();
                          }
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          color: selected
                              ? Colors.green.shade300
                              : Colors.white,
                          border: Border.all(color: Colors.black, width: 1.5),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          letter,
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
        ),
      ),
    );
  }
}
