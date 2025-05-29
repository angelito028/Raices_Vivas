import 'package:flutter/material.dart';

class Calculadoras extends StatelessWidget {
  const Calculadoras({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculadoras',
          style: TextStyle(color: Colors.black, fontFamily: 'Comic Sans MS'),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffc3b09a),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildShadowedOvalButton(
              label: 'Calculadora IMC',
              onPressed: () => Navigator.pushNamed(context, '/calculadora_IMC'),
            ),
            _buildShadowedOvalButton(
              label: 'Presión y Ritmo',
              onPressed: () => Navigator.pushNamed(context, '/calculadoraPR'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShadowedOvalButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35), // Ovalado
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4), // sombra hacia abajo
              blurRadius: 6,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffc6d8f8),
              fixedSize: const Size(250, 70),
              elevation: 0, // evita sombra interna por defecto
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
            ),
            onPressed: onPressed,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Comic Sans MS',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
