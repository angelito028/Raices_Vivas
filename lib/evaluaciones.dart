import 'package:flutter/material.dart';

class EvaluacionesScreen extends StatelessWidget {
  const EvaluacionesScreen({super.key});

  final List<Color> _cardColors = const [
    Color(0xff89abe5),
    Color(0xffcdd9ff),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFf5e9dc),
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
                label: 'Dependiente o independiente',
                routeName: '/evaluacion1',
                icon: Icons.person_search,
                colorIndex: 0,
              ),
              _buildStyledCardButton(
                context: context,
                label: 'Dfeiffer',
                routeName: '/evaluacion2',
                icon: Icons.psychology_alt_rounded,
                colorIndex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

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
          ),
        ),
      ),
    );
  }
}
