import 'package:flutter/material.dart';

class Bienvenida extends StatelessWidget {
  const Bienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff), // Blanco
      appBar: AppBar(
        backgroundColor: const Color(0xffc3b09a), // Café pastel
        title: const Text("Página de Inicio"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          // Permite desplazamiento en pantallas pequeñas
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.center, // Alineación centrada horizontal
            children: [
              // Imagen agregada
              Image.asset("assets/RV.png", width: 225, height: 200),

              const SizedBox(height: 20), // Espaciado
              const Text(
                "¡Bienvenido a nuestra página!",
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF6F4E37), // Café pastel
                ),
                textAlign:
                    TextAlign.center, // Asegura que el texto esté centrado
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Reemplaza esta pantalla por la de login
                  Navigator.pushReplacementNamed(context, "/login");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffc6d8f8), // Azul claro
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  "Comenzar",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
