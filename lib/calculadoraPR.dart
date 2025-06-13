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
  String _datosGuardados = "";

  void _calcularPresion() {
    int sistolica = int.tryParse(_presionSistolicaController.text) ?? 0;
    int diastolica = int.tryParse(_presionDiastolicaController.text) ?? 0;
    String resultado;

    if (sistolica <= 0 || diastolica <= 0) {
      resultado = "Por favor, ingrese valores válidos.";
    } else if (sistolica < 90 || diastolica < 60) {
      resultado = "Presión baja";
    } else if (sistolica <= 120 && diastolica <= 80) {
      resultado = "Presión normal";
    } else if (sistolica <= 139 || diastolica <= 89) {
      resultado = "Prehipertensión";
    } else {
      resultado = "Presión alta";
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
      resultado = "Ritmo bajo";
    } else if (ritmo <= 100) {
      resultado = "Ritmo normal";
    } else {
      resultado = "Ritmo alto";
    }

    setState(() {
      _resultadoRitmo = resultado;
    });
  }

  void _guardarDatos() {
    setState(() {
      _datosGuardados =
          "Presión: $_resultadoPresion\nRitmo Cardíaco: $_resultadoRitmo";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff5e9dc),
        elevation: 0,
        title: const Text('', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Regresa a la pantalla anterior
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSectionTitle("Calculadora de Presión Arterial"),
              _buildTextField(
                  _presionSistolicaController, "Presión sistólica (mm Hg)"),
              _buildTextField(
                  _presionDiastolicaController, "Presión diastólica (mm Hg)"),
              _buildButton("Evaluar Presión", _calcularPresion),
              _buildResultText(_resultadoPresion),
              const SizedBox(height: 40),
              _buildSectionTitle("Calculadora de Ritmo Cardíaco"),
              _buildTextField(
                  _ritmoCardiacoController, "Pulsaciones por minuto"),
              _buildButton("Evaluar Ritmo", _calcularRitmo),
              _buildResultText(_resultadoRitmo),
              const SizedBox(height: 40),
              _buildButton("Guardar Datos", _guardarDatos),
              _buildResultText(_datosGuardados),
            ],
          ),
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
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff89abe5),
          ),
          child: Text(text, style: const TextStyle(color: Colors.black)),
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
