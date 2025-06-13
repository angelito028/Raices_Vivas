import 'package:flutter/material.dart';

class PantallaAlimentacion extends StatelessWidget {
  const PantallaAlimentacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(
        backgroundColor: const Color(0xfff5e9dc),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildGeneralInfoCard(),
              const SizedBox(height: 16),
              _buildDiseaseWidget(
                '🍬 Diabetes',
                ['Verduras de hoja verde', 'Legumbres', 'Cereales integrales'],
                ['Azúcares refinados', 'Refrescos', 'Postres altos en azúcar'],
              ),
              _buildDiseaseWidget(
                '🩺 Hipertensión',
                ['Plátano', 'Espinaca', 'Aguacate'],
                ['Embutidos', 'Ultraprocesados', 'Exceso de sal'],
              ),
              const SizedBox(height: 16),
              _buildImportantInfoCard(),
              const SizedBox(height: 20),
              _buildPlatilloInfo(),
              const SizedBox(height: 20),
=======
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
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
            ],
          ),
        ),
      ),
    );
  }
<<<<<<< HEAD

  Widget _buildGeneralInfoCard() {
    return _buildCard(
      '🥗 Alimentación en adultos mayores',
      const Text(
        'Una alimentación balanceada es esencial en la tercera edad. '
        'Debe incluir proteínas magras, fibra, vitaminas y buena hidratación para mejorar la salud y la energía diaria.',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget _buildDiseaseWidget(
      String title, List<String> recomendados, List<String> noRecomendados) {
    return _buildCard(
      title,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '✅ Recomendados:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          ...recomendados.map((alimento) =>
              _buildAlimentoItem(alimento, Icons.check_circle, Colors.green)),
          const SizedBox(height: 12),
          const Text(
            '🚫 No recomendados:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          ...noRecomendados.map((alimento) =>
              _buildAlimentoItem(alimento, Icons.cancel, Colors.red)),
        ],
      ),
    );
  }

  Widget _buildAlimentoItem(String alimento, IconData icon, Color color) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.only(left: 8),
      leading: Icon(icon, color: color, size: 20),
      title: Text(
        alimento,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildImportantInfoCard() {
    return _buildCard(
      '📌 Importante',
      const Text(
        'Esta información es general. Siempre consulte a un profesional de salud o nutrición '
        'para adaptar la dieta a las necesidades específicas del adulto mayor.',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildPlatilloInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '🥣 El Plato del Buen Comer',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/platillo.png.jpg',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'El Plato del Buen Comer es una guía visual que ayuda a entender cómo debe ser una dieta equilibrada. '
          'Recomienda combinar verduras, frutas, cereales integrales y proteínas saludables en cada comida. '
          'Es útil como base para planear una alimentación adecuada para todas las edades.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildCard(String title, Widget content) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white.withOpacity(0.95),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xff3e3e3e),
              ),
            ),
            const SizedBox(height: 12),
            content,
          ],
        ),
      ),
    );
  }
=======
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
}
