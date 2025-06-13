import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
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
        ),
      ),
    );
  }
}
