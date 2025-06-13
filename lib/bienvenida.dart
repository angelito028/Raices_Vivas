import 'package:flutter/material.dart';

class Bienvenida extends StatelessWidget {
  const Bienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFf5e9dc), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Título
                const Text(
                  "Raíces Vivas",
                  style: TextStyle(
                    fontSize: 40,
                    color: Color(0xff89abe5),
                    fontFamily: 'ComicSansMS',
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                // Imagen
                Image.asset(
                  "assets/RV.png",
                  width: 270,
                  height: 270,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 40),

                // Botón estilizado
                Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                        blurRadius: 6,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/login");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff89abe5),
                        fixedSize: const Size(220, 60),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                      child: const Text(
                        "Comenzar",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontFamily: 'ComicSansMS',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
=======
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
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
          ),
        ),
      ),
    );
  }
}
