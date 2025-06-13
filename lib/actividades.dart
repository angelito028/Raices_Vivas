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
      imagen: 'assets/ej1.png.png',
    ),
    Ejercicio(
      titulo: "Extensión de rodillas",
      descripcion:
          "Sentado en una silla: Estire una y otra rodilla llevando la punta del zapato hacia arriba. 15 veces por pierna.",
      imagen: 'assets/ej2.png.png',
    ),
    Ejercicio(
      titulo: "Círculos con las caderas",
      descripcion:
          "De pie: Dibuje con su cadera un círculo hacia la derecha 5 veces y luego hacia la izquierda 5 veces.",
      imagen: 'assets/ej3.png.png',
    ),
    Ejercicio(
      titulo: "Elevación de brazos",
      descripcion:
          "De pie o sentado: Levante los brazos hacia arriba y bájelos lentamente. Repita 10 veces.",
      imagen: 'assets/ej4.png.png',
    ),
    Ejercicio(
      titulo: "Giros de tronco",
      descripcion:
          "Sentado: Gire lentamente el torso hacia la derecha y luego hacia la izquierda. 10 veces cada lado.",
      imagen: 'assets/ej5.png.png',
    ),
    Ejercicio(
      titulo: "Flexión de brazos",
      descripcion:
          "Sentado: Flexione los codos llevando las manos a los hombros. Repita 15 veces.",
      imagen: 'assets/ej6.png.png',
    ),
    Ejercicio(
      titulo: "Marcha en el lugar",
      descripcion:
          "De pie: Levante alternadamente las rodillas como si marchara en el lugar. 20 repeticiones.",
      imagen: 'assets/ej7.png.png',
    ),
    Ejercicio(
      titulo: "Apertura de brazos",
      descripcion:
          "De pie o sentado: Abra los brazos hacia los lados y regrese al centro. 10 repeticiones.",
      imagen: 'assets/ej8.png.png',
    ),
    Ejercicio(
      titulo: "Rotación de tobillos",
      descripcion:
          "Sentado: Eleve un pie y rote el tobillo 10 veces en cada dirección.",
      imagen: 'assets/ej9.png.png',
    ),
    Ejercicio(
      titulo: "Inclinación lateral",
      descripcion:
          "Sentado: Inclínese hacia un lado tratando de alcanzar el suelo, luego al otro. 10 veces por lado.",
      imagen: 'assets/ej10.png.png',
    ),
  ];

  double calificacion = 5.0;

  void marcarCompletado(int index) {
    setState(() {
      ejercicios[index].completado = !ejercicios[index].completado;
    });
  }

  int contarCompletados() {
    return ejercicios.where((e) => e.completado).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                        ),
                      ),
                    ],
                  ),
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
      ),
    );
  }
}

class Ejercicio {
  final String titulo;
  final String descripcion;
  final String imagen;
  bool completado;

  Ejercicio({
    required this.titulo,
    required this.descripcion,
    required this.imagen,
    this.completado = false,
  });
}
