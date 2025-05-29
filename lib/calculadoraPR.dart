import 'package:flutter/material.dart';

class CalculadoraPresionYRitmo extends StatefulWidget {
  const CalculadoraPresionYRitmo({super.key});

  @override
  State<CalculadoraPresionYRitmo> createState() =>
      _CalculadoraPresionYRitmoState();
}

class _CalculadoraPresionYRitmoState extends State<CalculadoraPresionYRitmo> {
  final TextEditingController _presionSistolicaController =
      TextEditingController();
  final TextEditingController _presionDiastolicaController =
      TextEditingController();
  final TextEditingController _ritmoCardiacoController =
      TextEditingController();

  String _resultadoPresion = "";
  String _resultadoRitmo = "";

  void _calcularPresion() {
    int sistolica = int.tryParse(_presionSistolicaController.text) ?? 0;
    int diastolica = int.tryParse(_presionDiastolicaController.text) ?? 0;
    String resultado;

    if (sistolica <= 0 || diastolica <= 0) {
      resultado = "Por favor, ingrese valores válidos.";
    } else if (sistolica < 90 || diastolica < 60) {
      resultado =
          "Presión baja.\n• Mantente hidratado.\n• Consulta si tienes síntomas como mareo.";
    } else if (sistolica <= 120 && diastolica <= 80) {
      resultado = "Presión normal.\n• Mantén un estilo de vida saludable.";
    } else if (sistolica <= 139 || diastolica <= 89) {
      resultado = "Prehipertensión.\n• Reduce sal y grasas.\n• Haz ejercicio.";
    } else {
      resultado =
          "Hipertensión.\n• Consulta a tu médico.\n• Controla tu dieta y estrés.";
    }

    setState(() {
      _resultadoPresion = resultado;
    });
  }

  void _calcularRitmo() {
    int ritmo = int.tryParse(_ritmoCardiacoController.text) ?? 0;
    String resultado;

    if (ritmo <= 0) {
      resultado = "Por favor, ingrese un valor válido.";
    } else if (ritmo < 60) {
      resultado =
          "Ritmo cardíaco bajo (bradicardia).\n• Puede ser normal en personas activas.\n• Consulta si hay síntomas.";
    } else if (ritmo <= 100) {
      resultado = "Ritmo cardíaco normal.\n• Mantén actividad física regular.";
    } else {
      resultado =
          "Ritmo cardíaco alto (taquicardia).\n• Evita cafeína y estrés.\n• Consulta a un médico si es frecuente.";
    }

    setState(() {
      _resultadoRitmo = resultado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presión y Ritmo Cardiaco'),
        centerTitle: true,
        backgroundColor: const Color(0xffc3b09a),
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSectionTitle("Calculadora de Presión Arterial"),
            _buildTextField(
              _presionSistolicaController,
              "Presión sistólica (mm Hg)",
            ),
            _buildTextField(
              _presionDiastolicaController,
              "Presión diastólica (mm Hg)",
            ),
            _buildButton("Evaluar Presión", _calcularPresion),
            _buildResultText(_resultadoPresion),
            const SizedBox(height: 40),
            _buildSectionTitle("Calculadora de Ritmo Cardíaco"),
            _buildTextField(_ritmoCardiacoController, "Pulsaciones por minuto"),
            _buildButton("Evaluar Ritmo", _calcularRitmo),
            _buildResultText(_resultadoRitmo),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
    ),
  );

  Widget _buildTextField(TextEditingController controller, String label) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
          ),
        ),
      );

  Widget _buildButton(String text, VoidCallback onPressed) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffc6d8f8)),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    ),
  );

  Widget _buildResultText(String result) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text(
      result,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
    ),
  );
}
