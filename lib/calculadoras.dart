import 'package:flutter/material.dart';

class Calculadoras extends StatelessWidget {
  const Calculadoras({super.key});

<<<<<<< HEAD
  final List<Color> _cardColors = const [
    Color(0xff89abe5),
    Color(0xffcdd9ff),
  ];

=======
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        backgroundColor: const Color(0xFFf5e9dc), // Mismo color del fondo
        elevation: 0,
        title: const Text(''),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFf5e9dc), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStyledCardButton(
                context: context,
                label: 'Calculadora IMC',
                routeName: '/calculadora_IMC',
                icon: Icons.monitor_weight,
                colorIndex: 0,
              ),
              _buildStyledCardButton(
                context: context,
                label: 'Presión y Ritmo',
                routeName: '/calculadoraPR',
                icon: Icons.favorite,
                colorIndex: 1,
              ),
            ],
          ),
=======
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
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
        ),
      ),
    );
  }

<<<<<<< HEAD
  Widget _buildStyledCardButton({
    required BuildContext context,
    required String label,
    required String routeName,
    required IconData icon,
    required int colorIndex,
  }) {
    final Color bgColor = _cardColors[colorIndex % _cardColors.length];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => Navigator.pushNamed(context, routeName),
        child: Container(
          height: 110,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    icon,
                    size: 40,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'Comic Sans MS',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 18.0),
                child: Icon(Icons.arrow_forward_ios_rounded,
                    color: Colors.black54),
              ),
            ],
=======
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
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
          ),
        ),
      ),
    );
  }
}
