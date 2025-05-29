import 'package:flutter/material.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffc3b09a),
        title: const Center(
          child: Text(
            'Raíces Vivas',
            style: TextStyle(color: Colors.black, fontFamily: 'Comic Sans MS'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        // Permite el desplazamiento vertical
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildShadowedOvalButton(context, 'Gericultura', "/gericultura"),
              _buildShadowedOvalButton(
                context,
                'Alimentación',
                "/alimentacion",
              ),
              _buildShadowedOvalButton(
                context,
                'Calculadoras',
                "/calculadoras",
              ),
              _buildShadowedOvalButton(context, 'Usuarios', "/registros"),
              _buildShadowedOvalButton(context, 'Actividades', "/actividades"),
              _buildShadowedOvalButton(
                context,
                'Evaluaciones',
                "/evaluaciones",
              ),
              const SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/juegos");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff89abe5),
                  fixedSize: const Size(250, 70),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
                child: Text(
                  "Juegos",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xff110e0e),
                    fontSize: 20,
                    fontFamily: 'Comic Sans MS',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShadowedOvalButton(
    BuildContext context,
    String label,
    String routeName,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 6,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff89abe5),
              fixedSize: const Size(250, 70),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, routeName);
            },
            child: Center(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xff110e0e),
                  fontSize: 20,
                  fontFamily: 'Comic Sans MS',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
