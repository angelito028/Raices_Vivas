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
<<<<<<< HEAD
      imagen: 'assets/ej1.png.png',
=======
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
    ),
    Ejercicio(
      titulo: "Extensión de rodillas",
      descripcion:
          "Sentado en una silla: Estire una y otra rodilla llevando la punta del zapato hacia arriba. 15 veces por pierna.",
<<<<<<< HEAD
      imagen: 'assets/ej2.png.png',
=======
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
    ),
    Ejercicio(
      titulo: "Círculos con las caderas",
      descripcion:
          "De pie: Dibuje con su cadera un círculo hacia la derecha 5 veces y luego hacia la izquierda 5 veces.",
<<<<<<< HEAD
      imagen: 'assets/ej3.png.png',
=======
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
    ),
    Ejercicio(
      titulo: "Elevación de brazos",
      descripcion:
          "De pie o sentado: Levante los brazos hacia arriba y bájelos lentamente. Repita 10 veces.",
<<<<<<< HEAD
      imagen: 'assets/ej4.png.png',
=======
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
    ),
    Ejercicio(
      titulo: "Giros de tronco",
      descripcion:
          "Sentado: Gire lentamente el torso hacia la derecha y luego hacia la izquierda. 10 veces cada lado.",
<<<<<<< HEAD
      imagen: 'assets/ej5.png.png',
=======
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
    ),
    Ejercicio(
      titulo: "Flexión de brazos",
      descripcion:
          "Sentado: Flexione los codos llevando las manos a los hombros. Repita 15 veces.",
<<<<<<< HEAD
      imagen: 'assets/ej6.png.png',
=======
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
    ),
    Ejercicio(
      titulo: "Marcha en el lugar",
      descripcion:
          "De pie: Levante alternadamente las rodillas como si marchara en el lugar. 20 repeticiones.",
<<<<<<< HEAD
      imagen: 'assets/ej7.png.png',
=======
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
    ),
    Ejercicio(
      titulo: "Apertura de brazos",
      descripcion:
          "De pie o sentado: Abra los brazos hacia los lados y regrese al centro. 10 repeticiones.",
<<<<<<< HEAD
      imagen: 'assets/ej8.png.png',
=======
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
    ),
    Ejercicio(
      titulo: "Rotación de tobillos",
      descripcion:
          "Sentado: Eleve un pie y rote el tobillo 10 veces en cada dirección.",
<<<<<<< HEAD
      imagen: 'assets/ej9.png.png',
=======
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
    ),
    Ejercicio(
      titulo: "Inclinación lateral",
      descripcion:
          "Sentado: Inclínese hacia un lado tratando de alcanzar el suelo, luego al otro. 10 veces por lado.",
<<<<<<< HEAD
      imagen: 'assets/ej10.png.png',
    ),
  ];

  double calificacion = 5.0;

=======
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

>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
  void marcarCompletado(int index) {
    setState(() {
      ejercicios[index].completado = !ejercicios[index].completado;
    });
  }

<<<<<<< HEAD
  int contarCompletados() {
    return ejercicios.where((e) => e.completado).length;
  }

=======
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: const Text(''),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFf5e9dc), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: ejercicios.length,
                itemBuilder: (context, index) {
                  final ejercicio = ejercicios[index];
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: ejercicio.completado
                          ? Colors.green[100]
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => marcarCompletado(index),
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 500),
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
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  ejercicio.titulo,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              ejercicio.imagen,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 180,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            ejercicio.descripcion,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100]?.withOpacity(0.9),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, -1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '✅ Ejercicios completados: ${contarCompletados()} / ${ejercicios.length}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Text('Calificación: ',
                          style: TextStyle(fontSize: 16)),
                      Expanded(
                        child: Slider(
                          value: calificacion,
                          min: 0,
                          max: 10,
                          divisions: 10,
                          label: calificacion.toStringAsFixed(1),
                          onChanged: (value) {
                            setState(() {
                              calificacion = value;
                            });
                          },
=======
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
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
                        ),
                      ),
                    ],
                  ),
<<<<<<< HEAD
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: () {
                      int completados = contarCompletados();
                      double cal = calificacion;

                      print('Ejercicios completados: $completados');
                      print('Calificación: $cal');

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Datos guardados')),
                      );

                      setState(() {
                        for (var ejercicio in ejercicios) {
                          ejercicio.completado = false;
                        }
                        calificacion = 5.0;
                      });
                    },
                    icon: const Icon(Icons.save),
                    label: const Text('Guardar progreso'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
=======
                  SizedBox(height: 8),
                  Text(ejercicio.descripcion),
                  SizedBox(height: 8),
                ],
              ),
            ),
          );
        },
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
      ),
    );
  }
}

class Ejercicio {
  final String titulo;
  final String descripcion;
<<<<<<< HEAD
  final String imagen;
=======
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
  bool completado;

  Ejercicio({
    required this.titulo,
    required this.descripcion,
<<<<<<< HEAD
    required this.imagen,
=======
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
    this.completado = false,
  });
}
