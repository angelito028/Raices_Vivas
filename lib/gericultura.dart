import 'package:flutter/material.dart';

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
        ),
      ),
    );
  }
}
