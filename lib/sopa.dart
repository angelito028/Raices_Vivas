import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
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
        ),
      ),
    );
  }
}
