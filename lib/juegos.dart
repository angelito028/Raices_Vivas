import 'package:flutter/material.dart';

class JuegosScreen extends StatelessWidget {
  const JuegosScreen({super.key});

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
        elevation: 0, // Sin sombra
        title: const Text(''),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Regresa a la pantalla anterior
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFf5e9dc),
              Colors.white
            ], // Fondo igual al principal
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
                label: 'Memorama',
                routeName: "/memorama",
                icon: Icons.memory,
                colorIndex: 0,
              ),
              _buildStyledCardButton(
                context: context,
                label: 'Encuentra el emoji',
                routeName: "/sopa_letras",
                icon: Icons.emoji_emotions,
                colorIndex: 1,
              ),
            ],
          ),
=======
        backgroundColor: const Color(0xffc3b09a),
        title: const Text(
          'Raices Vivas',
          style: TextStyle(color: Colors.black, fontFamily: 'Comic Sans MS'),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildShadowedOvalButton(
              context: context,
              label: 'Memorama',
              routeName: "/memorama",
            ),
            _buildShadowedOvalButton(
              context: context,
              label: 'Sopa de Letras',
              routeName: "/sopa_letras",
            ),
            _buildShadowedOvalButton(
              context: context,
              label: 'Botón',
              routeName: "/boton",
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
    required BuildContext context,
    required String label,
    required String routeName,
  }) {
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
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xff110e0e),
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
<<<<<<< HEAD
=======

class BotonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Botón'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(child: Text('Aquí irá otra funcionalidad')),
    );
  }
}
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
