import 'package:flutter/material.dart';

<<<<<<< HEAD
class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _Modulo {
  final String label;
  final String route;
  final IconData icon;
  final int participantes;
  const _Modulo(this.label, this.route, this.icon, this.participantes);
}

class _PrincipalState extends State<Principal> {
  bool _showSidePanel = false;

  final List<_Modulo> _modulos = const [
    _Modulo('Gericultura', '/gericultura', Icons.health_and_safety, 34),
    _Modulo('Alimentación', '/alimentacion', Icons.restaurant_menu, 26),
    _Modulo('Calculadoras', '/calculadoras', Icons.calculate, 19),
    _Modulo('Actividades', '/actividades', Icons.run_circle, 30),
    _Modulo('Evaluaciones', '/evaluaciones', Icons.assignment, 15),
    _Modulo('Juegos', '/juegos', Icons.videogame_asset, 10),
  ];

  final List<Color> _cardColors = const [
    Color(0xff89abe5),
    Color(0xffcdd9ff),
  ];

  void _toggleSidePanel() => setState(() => _showSidePanel = !_showSidePanel);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Fondo degradado
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFf5e9dc), Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: SizedBox(height: 24)),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          _buildCourseCard(context, _modulos[index], index),
                      childCount: _modulos.length,
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 20)),
                ],
              ),
            ),

            // Botón superior derecho
            Positioned(
              top: 12,
              right: 12,
              child: GestureDetector(
                onTap: _toggleSidePanel,
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.black),
                ),
              ),
            ),

            // Panel lateral
            if (_showSidePanel) ...[
              GestureDetector(
                onTap: _toggleSidePanel,
                child: Container(color: Colors.black.withOpacity(0.3)),
              ),
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: SizedBox(
                  width: screenWidth * 0.55,
                  child: Material(
                    elevation: 12,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFf5e9dc), Colors.white],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 40),
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person,
                                size: 30, color: Colors.black),
                          ),
                          const SizedBox(height: 20),
                          const Divider(thickness: 1.2),
                          ListTile(
                            leading: const Icon(Icons.switch_account,
                                color: Colors.black87),
                            title: const Text("Cambiar cuenta"),
                            onTap: _toggleSidePanel,
                          ),
                          ListTile(
                            leading: const Icon(Icons.logout,
                                color: Colors.redAccent),
                            title: const Text(
                              "Salir de la cuenta",
                              style: TextStyle(color: Colors.redAccent),
                            ),
                            onTap: _toggleSidePanel,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 8),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              color: const Color(0xFFa6c8ff),
                              elevation: 4,
                              child: ListTile(
                                leading: const Icon(Icons.person_add_alt_1,
                                    color: Colors.white),
                                title: const Text(
                                  "Agregar paciente",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                onTap: () {
                                  _toggleSidePanel();
                                  Navigator.pushNamed(context, '/registros');
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 8),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              color: const Color(0xFF7ba1f7),
                              elevation: 4,
                              child: ListTile(
                                leading: const Icon(Icons.swap_horiz,
                                    color: Colors.white),
                                title: const Text(
                                  "Cambiar de paciente",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                onTap: () {
                                  _toggleSidePanel();
                                  Navigator.pushNamed(
                                      context, '/cambiar_paciente');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
=======
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
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
                  ),
                ),
              ),
            ],
<<<<<<< HEAD
          ],
        ),
      ),
    );
  }

  Widget _buildCourseCard(BuildContext context, _Modulo modulo, int index) {
    final bgColor = _cardColors[index % _cardColors.length];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => Navigator.pushNamed(context, modulo.route),
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
                    modulo.icon,
                    size: 40,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  modulo.label,
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
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
          ),
        ),
      ),
    );
  }
}
