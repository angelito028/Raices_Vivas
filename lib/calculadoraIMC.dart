import 'package:flutter/material.dart';

class CalculadoraIMC extends StatefulWidget {
  const CalculadoraIMC({super.key});

  @override
  State<CalculadoraIMC> createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();

  String _resultadoIMC = "";
  String _recomendacionIMC = "";

  void _calcularIMC() {
    double peso = double.tryParse(_pesoController.text) ?? 0;
    double altura = double.tryParse(_alturaController.text) ?? 0;

    if (peso > 0 && altura > 0) {
      double imc = peso / (altura * altura);
      String interpretacion;
      String recomendacion;

      if (imc < 18.5) {
        interpretacion = "Bajo peso";
        recomendacion =
            "• Aumenta la ingesta de calorías saludables.\n• Incluye más proteínas, grasas buenas y carbohidratos.\n• Consulta con un nutricionista.";
      } else if (imc < 24.9) {
        interpretacion = "Peso normal";
        recomendacion =
            "• Mantén una dieta equilibrada.\n• Realiza actividad física regularmente.\n• Hidrátate bien.";
      } else if (imc < 29.9) {
        interpretacion = "Sobrepeso";
        recomendacion =
            "• Reduce alimentos altos en grasa y azúcar.\n• Aumenta la actividad física.\n• Considera asesoramiento nutricional.";
      } else {
        interpretacion = "Obesidad";
        recomendacion =
            "• Es importante consultar con un médico.\n• Sigue un plan de alimentación saludable.\n• Realiza actividad física bajo supervisión.";
      }

      setState(() {
        _resultadoIMC = "IMC: ${imc.toStringAsFixed(2)}\n$interpretacion";
        _recomendacionIMC = "Recomendaciones:\n$recomendacion";
      });
    } else {
      setState(() {
        _resultadoIMC = "Por favor, ingrese valores válidos.";
        _recomendacionIMC = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: const Color(0xffc3b09a),
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSectionTitle("Calculadora de IMC"),
            _buildTextField(_pesoController, "Peso (kg)"),
            _buildTextField(_alturaController, "Altura (m)"),
            _buildButton("Calcular IMC", _calcularIMC),
            _buildResultText(_resultadoIMC),
            _buildResultText(_recomendacionIMC),
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
