import 'package:flutter/material.dart';

<<<<<<< HEAD
class GericulturaScreen extends StatefulWidget {
  const GericulturaScreen({super.key});

  @override
  State<GericulturaScreen> createState() => _GericulturaScreenState();
}

class _GericulturaScreenState extends State<GericulturaScreen> {
  final Map<String, bool> expanded = {
    'Introducción': false,
    'Ámbitos de la gericultura': false,
    'Beneficios': false,
  };

  void toggleExpand(String section) {
    setState(() {
      expanded[section] = !expanded[section]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
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
              _buildHeader(),
              const SizedBox(height: 20),
              _buildExpandableSection(
                'Introducción',
                'La gericultura es una disciplina enfocada en el cuidado integral de los adultos mayores, '
                    'abarcando aspectos físicos, psicológicos y sociales para garantizar su bienestar.',
              ),
              _buildExpandableSection(
                'Ámbitos de la gericultura',
                '✅ **Salud Física:** Atención médica y prevención de enfermedades.\n'
                    '✅ **Salud Mental:** Apoyo emocional y terapias cognitivas.\n'
                    '✅ **Nutrición:** Dietas equilibradas para mejorar la calidad de vida.\n'
                    '✅ **Actividad Física:** Ejercicio adaptado a cada persona.',
              ),
              _buildExpandableSection(
                'Beneficios',
                '💙 Mejora la calidad de vida.\n'
                    '💙 Promueve la autonomía del adulto mayor.\n'
                    '💙 Ayuda a mantener una mente activa.\n'
                    '💙 Reduce el riesgo de enfermedades relacionadas con la edad.',
              ),
              const SizedBox(height: 20),
              _buildImportantInfoCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff89abe5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: const [
          Icon(Icons.elderly, size: 40, color: Colors.white),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'La gericultura ayuda al bienestar integral del adulto mayor',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableSection(String title, String content) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              expanded[title]!
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
              size: 30,
            ),
            onTap: () => toggleExpand(title),
          ),
          if (expanded[title]!)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                content,
                style: const TextStyle(fontSize: 18),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildImportantInfoCard() {
    return _buildCard(
      'Importante',
      'La gericultura es clave para el bienestar de los adultos mayores. '
          'Para asesoramiento profesional, consulte a un especialista en geriatría.',
    );
  }

  Widget _buildCard(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.white.withOpacity(0.9),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                content,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
=======
class GericulturaScreen extends StatelessWidget {
  const GericulturaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Raíces Vivas'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2, // Sombra para mejorar la visibilidad
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            // Subtítulo con diseño mejorado (sin líneas de división)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xff89abe5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'GERICULTURA',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Texto informativo con mejor legibilidad
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'La gericultura es una disciplina que se enfoca en el cuidado integral de los adultos mayores, combinando conocimientos de geriatría y gerontología. Su objetivo es promover un envejecimiento saludable y brindar atención tanto a personas mayores con patologías como a aquellas que están sanas.\n\n'
                'En términos prácticos, la gericultura abarca enfermería, psicología, nutrición y rehabilitación, asegurando el bienestar físico, emocional y social de los adultos mayores.',
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 80),
          ],
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
        ),
      ),
    );
  }
}
