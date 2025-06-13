import 'package:flutter/material.dart';

<<<<<<< HEAD
void main() => runApp(const MaterialApp(home: CalculadoraIMC()));

=======
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
class CalculadoraIMC extends StatefulWidget {
  const CalculadoraIMC({super.key});

  @override
  State<CalculadoraIMC> createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
<<<<<<< HEAD
  final TextEditingController _edadController = TextEditingController();

  String _resultadoIMC = "";
  String _recomendacionIMC = "";
  String _analisisEdad = "";
  double _imc = 0;
=======

  String _resultadoIMC = "";
  String _recomendacionIMC = "";
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f

  void _calcularIMC() {
    double peso = double.tryParse(_pesoController.text) ?? 0;
    double altura = double.tryParse(_alturaController.text) ?? 0;
<<<<<<< HEAD
    int edad = int.tryParse(_edadController.text) ?? 0;

    if (peso > 0 && altura > 0 && edad > 0) {
      setState(() {
        _imc = peso / (altura * altura);
        _resultadoIMC = "IMC: ${_imc.toStringAsFixed(2)}";

        if (_imc < 24.9) {
          _recomendacionIMC = "";
        } else {
          _recomendacionIMC = "IMC por encima del estándar.";
        }

        _analisisEdad = _obtenerAnalisisEdad(_imc, edad);
      });
    } else {
      setState(() {
        _resultadoIMC = "Por favor, ingresa valores válidos.";
        _recomendacionIMC = "";
        _analisisEdad = "";
        _imc = 0;
      });
    }
  }

  String _obtenerAnalisisEdad(double imc, int edad) {
    if (edad >= 60) {
      if (imc < 23) {
        return "Para adultos mayores, un IMC menor a 23 puede indicar bajo peso.";
      } else if (imc <= 30) {
        return "Este IMC es adecuado para adultos mayores (entre 23 y 30).";
      } else {
        return "El IMC está elevado para un adulto mayor (mayor a 30).";
      }
    } else {
      if (imc < 18.5) {
        return "Bajo peso para tu edad.";
      } else if (imc <= 24.9) {
        return "Peso saludable.";
      } else if (imc <= 29.9) {
        return "Sobrepeso.";
      } else {
        return "Obesidad.";
      }
=======

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
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: const Text(''),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
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
              _buildSectionTitle("Calculadora de IMC"),
              _buildTextField(_edadController, "Edad (años)"),
              _buildTextField(_pesoController, "Peso (kg)"),
              _buildTextField(_alturaController, "Altura (m)"),
              _buildButton("Calcular IMC", _calcularIMC),
              _buildResultText(_resultadoIMC),
              _buildResultText(_recomendacionIMC),
              const SizedBox(height: 20),
              IMCBarChart(imc: _imc),
              const SizedBox(height: 20),
              if (_analisisEdad.isNotEmpty) _buildResultText(_analisisEdad),
            ],
          ),
=======
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
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) => Padding(
<<<<<<< HEAD
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
=======
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
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f

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
<<<<<<< HEAD
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff89abe5),
          ),
          child: Text(text, style: const TextStyle(color: Color(0xff000000))),
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

class IMCBarChart extends StatelessWidget {
  final double imc;
  const IMCBarChart({required this.imc});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(300, 200),
      painter: IMCBarChartPainter(imc),
    );
  }
}

class IMCBarChartPainter extends CustomPainter {
  final double imc;

  IMCBarChartPainter(this.imc);

  final List<double> thresholds = [18.5, 24.9, 29.9, 40.0];
  final List<Color> colors = [
    Colors.lightBlueAccent, // Bajo peso
    Colors.green, // Normal
    Colors.orange, // Sobrepeso
    Colors.redAccent // Obesidad
  ];
  final List<String> labels = ["Bajo peso", "Normal", "Sobrepeso", "Obesidad"];

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    double barHeight = 40;
    double leftMargin = 20;
    double topMargin = 50;

    double totalWidth = width - 2 * leftMargin;
    double maxIMC = thresholds.last;

    double lastX = leftMargin;
    for (int i = 0; i < thresholds.length; i++) {
      double start = (i == 0) ? 0 : thresholds[i - 1];
      double sectionWidth = ((thresholds[i] - start) / maxIMC) * totalWidth;
      Paint sectionPaint = Paint()..color = colors[i];
      Rect rect = Rect.fromLTWH(lastX, topMargin, sectionWidth, barHeight);
      canvas.drawRect(rect, sectionPaint);

      TextPainter tp = TextPainter(
        text: TextSpan(
          text: labels[i],
          style: const TextStyle(color: Colors.black, fontSize: 12),
        ),
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(canvas, Offset(lastX + 5, topMargin + barHeight + 5));

      lastX += sectionWidth;
    }

    if (imc > 0 && imc <= maxIMC) {
      double imcX = leftMargin + (imc / maxIMC) * totalWidth;
      Paint linePaint = Paint()
        ..color = Colors.black
        ..strokeWidth = 3;
      canvas.drawLine(
        Offset(imcX, topMargin - 10),
        Offset(imcX, topMargin + barHeight + 10),
        linePaint,
      );

      TextPainter tp = TextPainter(
        text: TextSpan(
          text: "IMC: ${imc.toStringAsFixed(1)}",
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
        ),
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(canvas, Offset(imcX - tp.width / 2, topMargin - 30));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
=======
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
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
}
