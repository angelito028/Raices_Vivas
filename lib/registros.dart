import 'package:flutter/material.dart';

class RegistroUsuariosScreen extends StatefulWidget {
  const RegistroUsuariosScreen({super.key});

  @override
  State<RegistroUsuariosScreen> createState() => _RegistroUsuariosScreenState();
}

class _RegistroUsuariosScreenState extends State<RegistroUsuariosScreen> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController edadController = TextEditingController();
  String sexoSeleccionado = 'Hombre';
  String padecimientoSeleccionado = 'Ninguno';
  final TextEditingController frecuenciaController = TextEditingController();
  final TextEditingController presionController = TextEditingController();
  final TextEditingController temperaturaController = TextEditingController();

  void verificarDatos() {
    double? frecuencia = double.tryParse(frecuenciaController.text);
    double? presion = double.tryParse(presionController.text);
    double? temperatura = double.tryParse(temperaturaController.text);

    String mensaje =
        "Parámetros normales:\n"
        "- Frecuencia Cardíaca: 60 - 100 bpm\n"
        "- Presión Arterial: 90/60 - 120/80 mmHg\n"
        "- Temperatura Corporal: 36.1 - 37.2°C\n\n"
        "Resultados:\n";

    if (frecuencia != null) {
      if (frecuencia < 60) {
        mensaje +=
            "- Frecuencia cardíaca baja: Podría ser signo de bradicardia. Consulte a un médico.\n";
      } else if (frecuencia > 100) {
        mensaje +=
            "- Frecuencia cardíaca alta: Puede indicar taquicardia. Considere reposo o visita médica.\n";
      } else {
        mensaje += "- Frecuencia cardíaca normal.\n";
      }
    }

    if (presion != null) {
      if (presion < 90) {
        mensaje +=
            "- Presión arterial baja: Puede causar mareos o desmayos. Hidratación recomendada.\n";
      } else if (presion > 120) {
        mensaje +=
            "- Presión arterial alta: Riesgo de hipertensión. Reduzca el consumo de sal y estrés.\n";
      } else {
        mensaje += "- Presión arterial normal.\n";
      }
    }

    if (temperatura != null) {
      if (temperatura < 36.1) {
        mensaje +=
            "- Temperatura baja: Posible hipotermia. Abríguese y consuma bebidas calientes.\n";
      } else if (temperatura > 37.2) {
        mensaje +=
            "- Temperatura alta: Puede indicar fiebre. Descanso y líquidos recomendados.\n";
      } else {
        mensaje += "- Temperatura normal.\n";
      }
    }

    if (padecimientoSeleccionado != 'Ninguno') {
      mensaje += "\nConsejo específico para ${padecimientoSeleccionado}:\n";
      switch (padecimientoSeleccionado) {
        case 'Alzheimer':
          mensaje +=
              "- Mantenga una rutina diaria y refuerce la memoria con actividades cognitivas.\n";
          break;
        case 'Demencia vascular':
          mensaje +=
              "- Controle factores de riesgo como la hipertensión y mantenga actividad física.\n";
          break;
        case 'Demencia con cuerpos de Lewy':
          mensaje +=
              "- Evite cambios bruscos de iluminación y consulte estrategias de manejo conductual.\n";
          break;
        case 'Demencia frontotemporal':
          mensaje +=
              "- Fomente la comunicación clara y estructurada, minimizando frustraciones.\n";
          break;
      }
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Resultados"),
          content: Text(mensaje),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cerrar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Usuarios'),
        centerTitle: true,
        backgroundColor: Color(0xffc3b09a),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Datos del paciente',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            buildInputField('Nombre', nombreController),
            SizedBox(height: 10),
            buildInputField('Edad', edadController, isNumeric: true),
            SizedBox(height: 10),
            buildDropdownField('Sexo', [
              'Hombre',
              'Mujer',
            ], (value) => sexoSeleccionado = value),
            SizedBox(height: 10),
            buildDropdownField('Padecimientos', [
              'Ninguno',
              'Alzheimer',
              'Demencia vascular',
              'Demencia con cuerpos de Lewy',
              'Demencia frontotemporal',
            ], (value) => padecimientoSeleccionado = value),
            SizedBox(height: 20),
            Text(
              'Parámetros Médicos',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            buildInputField(
              'Frecuencia Cardíaca',
              frecuenciaController,
              isNumeric: true,
            ),
            SizedBox(height: 10),
            buildInputField(
              'Presión Arterial',
              presionController,
              isNumeric: true,
            ),
            SizedBox(height: 10),
            buildInputField(
              'Temperatura',
              temperaturaController,
              isNumeric: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: verificarDatos,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffc6d8f8),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Registrar Datos',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ), // Texto del botón cambiado a blanco
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputField(
    String label,
    TextEditingController controller, {
    bool isNumeric = false,
  }) {
    return TextField(
      controller: controller,
      keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget buildDropdownField(
    String label,
    List<String> options,
    Function(String) onChanged,
  ) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      value: options.first,
      items: options
          .map((option) => DropdownMenuItem(value: option, child: Text(option)))
          .toList(),
      onChanged: (value) => setState(() => onChanged(value!)),
    );
  }
}
