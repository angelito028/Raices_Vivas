import 'package:flutter/material.dart';

class Bienvenida extends StatelessWidget {
  const Bienvenida({super.key});

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
          ),
        ),
      ),
    );
  }
}
