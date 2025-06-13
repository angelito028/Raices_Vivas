import 'package:flutter/material.dart';

class Evaluacion1 extends StatefulWidget {
  const Evaluacion1({super.key});

  @override
  State<Evaluacion1> createState() => _Evaluacion1State();
}

class _Evaluacion1State extends State<Evaluacion1> {
  int score = 0;
  final Map<String, String> answers = {};

  final questions = [
    "¿Puede realizar sus actividades diarias sin ayuda?",
    "¿Es capaz de vestirse y asearse sin asistencia?",
    "¿Puede preparar su comida sin dificultades?",
    "¿Maneja su dinero y pagos sin ayuda?",
    "¿Puede realizar compras sin acompañante?",
    "¿Tiene facilidad para transportarse solo?",
    "¿Puede administrar sus medicamentos sin supervisión?",
    "¿Sabe gestionar sus citas y compromisos sin ayuda?",
    "¿Participa activamente en conversaciones y actividades sociales?",
    "¿Puede resolver problemas cotidianos sin ayuda?",
    "¿Tiene una red de apoyo cercana en caso de necesitar ayuda?",
    "¿Es capaz de pedir ayuda cuando lo necesita?",
    "¿Puede realizar tareas del hogar sin asistencia?",
    "¿Maneja bien situaciones de estrés sin apoyo externo?",
    "¿Se siente seguro al estar solo en casa?",
    "¿Toma decisiones importantes sin influencia externa?",
  ];

  void updateScore() {
    setState(() {
      score = answers.values.where((v) => v == "Sí").length;
    });
  }

  String getRecommendation(int score) {
    if (score >= 12) {
      return "Parece ser una persona independiente. Continúe con sus hábitos saludables y siga fortaleciendo su autonomía.";
    } else if (score >= 8) {
      return "Tiene cierta independencia, pero sería útil reforzar algunos aspectos para mejorar su autonomía.";
    } else if (score >= 4) {
      return "Existen señales de dependencia. Es recomendable contar con apoyo en ciertas tareas diarias.";
    } else {
      return "Se observa una alta dependencia. Sería ideal considerar asistencia o acompañamiento profesional.";
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
              "Puntos: $score",
              style: TextStyle(fontSize: 20, fontFamily: "Comic Sans MS"),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xFF89ABE5),
                    ),
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
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xFF89ABE5),
                    ),
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
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xFF89ABE5),
                    ),
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
