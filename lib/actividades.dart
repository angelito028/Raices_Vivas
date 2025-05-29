import 'package:flutter/material.dart';

class EjerciciosScreen extends StatefulWidget {
  const EjerciciosScreen({super.key});

  @override
  State<EjerciciosScreen> createState() => _EjerciciosScreenState();
}

class _EjerciciosScreenState extends State<EjerciciosScreen> {
  final List<Ejercicio> ejercicios = [
    Ejercicio(
      titulo: "Movimiento circular de los pies",
      descripcion:
          "Sentado en una silla: Con el pie derecho, sin tocar el suelo, dibuje círculos. Repita con el pie izquierdo. 15 veces cada lado.",
    ),
    Ejercicio(
      titulo: "Extensión de rodillas",
      descripcion:
          "Sentado en una silla: Estire una y otra rodilla llevando la punta del zapato hacia arriba. 15 veces por pierna.",
    ),
    Ejercicio(
      titulo: "Círculos con las caderas",
      descripcion:
          "De pie: Dibuje con su cadera un círculo hacia la derecha 5 veces y luego hacia la izquierda 5 veces.",
    ),
    Ejercicio(
      titulo: "Elevación de brazos",
      descripcion:
          "De pie o sentado: Levante los brazos hacia arriba y bájelos lentamente. Repita 10 veces.",
    ),
    Ejercicio(
      titulo: "Giros de tronco",
      descripcion:
          "Sentado: Gire lentamente el torso hacia la derecha y luego hacia la izquierda. 10 veces cada lado.",
    ),
    Ejercicio(
      titulo: "Flexión de brazos",
      descripcion:
          "Sentado: Flexione los codos llevando las manos a los hombros. Repita 15 veces.",
    ),
    Ejercicio(
      titulo: "Marcha en el lugar",
      descripcion:
          "De pie: Levante alternadamente las rodillas como si marchara en el lugar. 20 repeticiones.",
    ),
    Ejercicio(
      titulo: "Apertura de brazos",
      descripcion:
          "De pie o sentado: Abra los brazos hacia los lados y regrese al centro. 10 repeticiones.",
    ),
    Ejercicio(
      titulo: "Rotación de tobillos",
      descripcion:
          "Sentado: Eleve un pie y rote el tobillo 10 veces en cada dirección.",
    ),
    Ejercicio(
      titulo: "Inclinación lateral",
      descripcion:
          "Sentado: Inclínese hacia un lado tratando de alcanzar el suelo, luego al otro. 10 veces por lado.",
    ),
    Ejercicio(
      titulo: "Elevación de talones",
      descripcion:
          "De pie: Eleve los talones manteniendo la espalda recta. 15 repeticiones.",
    ),
    Ejercicio(
      titulo: "Estiramiento de cuello",
      descripcion:
          "Sentado o de pie: Incline la cabeza hacia un lado manteniendo la postura. 10 segundos por lado.",
    ),
    Ejercicio(
      titulo: "Flexión de dedos",
      descripcion:
          "Sentado: Abra y cierre los dedos de las manos repetidamente. 20 veces.",
    ),
    Ejercicio(
      titulo: "Respiración profunda",
      descripcion:
          "Sentado o de pie: Inhale profundamente por la nariz y exhale por la boca. 5 veces.",
    ),
    Ejercicio(
      titulo: "Estiramiento de espalda",
      descripcion:
          "De pie: Coloque las manos en la parte baja de la espalda y estire hacia atrás suavemente. 10 segundos.",
    ),
  ];

  void marcarCompletado(int index) {
    setState(() {
      ejercicios[index].completado = !ejercicios[index].completado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicios para Adultos Mayores'),
        backgroundColor: Color(0xff9fb7e1),
      ),
      body: ListView.builder(
        itemCount: ejercicios.length,
        itemBuilder: (context, index) {
          final ejercicio = ejercicios[index];
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: ejercicio.completado ? Colors.green[100] : Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => marcarCompletado(index),
                        child: AnimatedOpacity(
                          duration: Duration(milliseconds: 500),
                          opacity: ejercicio.completado ? 1.0 : 0.7,
                          child: Icon(
                            ejercicio.completado
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: ejercicio.completado
                                ? Colors.green
                                : Colors.grey,
                            size: 28,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          ejercicio.titulo,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(ejercicio.descripcion),
                  SizedBox(height: 8),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Ejercicio {
  final String titulo;
  final String descripcion;
  bool completado;

  Ejercicio({
    required this.titulo,
    required this.descripcion,
    this.completado = false,
  });
}
