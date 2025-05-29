import 'package:flutter/material.dart';

class Evaluacion2 extends StatefulWidget {
  const Evaluacion2({super.key});

  @override
  _Evaluacion2State createState() => _Evaluacion2State();
}

class _Evaluacion2State extends State<Evaluacion2> {
  int score = 0;
  final Map<String, String> answers = {};

  final questions = [
    "¿En qué año estamos?",
    "¿En qué mes estamos?",
    "¿Cuál es el día de hoy?",
    "¿Cómo se llama el lugar donde estamos?",
    "¿Cuántos hijos tiene usted?",
    "¿En qué país vivimos?",
    "¿Quién es el presidente actualmente?",
    "¿Puede contar hacia atrás desde 20 hasta 10?",
    "¿Recuerda alguna noticia reciente?",
    "¿Cuántos años tiene?",
  ];

  void updateScore() {
    setState(() {
      score = answers.values.where((v) => v == "No").length;
    });
  }

  String getRecommendation(int score) {
    if (score <= 2) {
      return "Sin deterioro cognitivo significativo.";
    } else if (score <= 4) {
      return "Deterioro cognitivo leve. Se recomienda seguimiento.";
    } else if (score <= 6) {
      return "Deterioro cognitivo moderado. Consulte a un especialista.";
    } else {
      return "Deterioro cognitivo severo. Evaluación médica recomendada.";
    }
  }

  void resetAnswers() {
    setState(() {
      answers.clear();
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffc3b09a),
        title: const Text(
          'Test de Pfeiffer',
          style: TextStyle(color: Colors.black, fontFamily: 'Comic Sans MS'),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Table(
                  border: TableBorder.all(),
                  columnWidths: {
                    0: FlexColumnWidth(3),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                  },
                  children: [
                    TableRow(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Pregunta",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Sí",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "No",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    ...questions.map((question) {
                      return TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              question,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Comic Sans MS",
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                answers[question] = "Sí";
                                updateScore();
                              });
                            },
                            child: Icon(
                              answers[question] == "Sí"
                                  ? Icons.check_circle
                                  : Icons.radio_button_unchecked,
                              color: Colors.green,
                              size: 28,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                answers[question] = "No";
                                updateScore();
                              });
                            },
                            child: Icon(
                              answers[question] == "No"
                                  ? Icons.check_circle
                                  : Icons.radio_button_unchecked,
                              color: Colors.red,
                              size: 28,
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Errores: $score",
              style: TextStyle(fontSize: 20, fontFamily: "Comic Sans MS"),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff89abe5),
                  ),
                  onPressed: resetAnswers,
                  child: Text(
                    "Reiniciar",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Comic Sans MS",
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff89abe5),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          "Resultado",
                          style: TextStyle(fontFamily: "Comic Sans MS"),
                        ),
                        content: Text(
                          getRecommendation(score),
                          style: TextStyle(fontFamily: "Comic Sans MS"),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Aceptar"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text(
                    "Evaluar",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Comic Sans MS",
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff89abe5),
                  ),
                  onPressed: () {
                    // Lógica de guardar resultados
                  },
                  child: Text(
                    "Guardar",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Comic Sans MS",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
