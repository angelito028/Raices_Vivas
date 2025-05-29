import 'package:flutter/material.dart';

class PantallaAlimentacion extends StatelessWidget {
  const PantallaAlimentacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar que permite retroceder automáticamente
      appBar: AppBar(
        backgroundColor: Color(0xffc3b09a),
        title: Text(
          'Raíces Vivas',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading:
            true, // <-- Esto muestra la flecha de retroceso
        iconTheme: IconThemeData(
          color: Colors.black,
        ), // <-- Asegura que la flecha sea visible
      ),
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo_alimentacion.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // ScrollView para permitir el desplazamiento vertical
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                // Tarjeta inicial
                _buildCard(
                  'Alimentación en adultos mayores',
                  'Una buena alimentación es esencial para el bienestar de los adultos mayores. '
                      'Debe incluir una dieta equilibrada con proteínas, fibra y vitaminas, así como '
                      'una adecuada hidratación.',
                ),
                SizedBox(height: 20),
                _buildCard(
                  'Alimentos Recomendados',
                  '✔ Frutas y verduras (5 porciones al día)\n'
                      '✔ Proteína magra como pollo y pescado (2 porciones al día)\n'
                      '✔ Cereales integrales como avena y arroz integral (3 porciones al día)\n'
                      '✔ Agua y líquidos naturales (8 vasos al día)',
                ),
                SizedBox(height: 20),
                _buildCard(
                  'Alimentos No Recomendados',
                  '❌ Alimentos ultraprocesados y frituras\n'
                      '❌ Azúcares añadidos y refrescos\n'
                      '❌ Carnes rojas en exceso\n'
                      '❌ Exceso de sal y alimentos con conservantes',
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String content) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.white.withOpacity(0.9),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(content, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
