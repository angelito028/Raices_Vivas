import 'package:flutter/material.dart';

class RegistroUsuariosScreen extends StatefulWidget {
  const RegistroUsuariosScreen({super.key});

  @override
  State<RegistroUsuariosScreen> createState() => _RegistroUsuariosScreenState();
}

class _RegistroUsuariosScreenState extends State<RegistroUsuariosScreen> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController edadController = TextEditingController();
<<<<<<< HEAD
  final TextEditingController frecuenciaController = TextEditingController();
  final TextEditingController temperaturaController = TextEditingController();
  final TextEditingController presionSistolicaController =
      TextEditingController();
  final TextEditingController presionDiastolicaController =
      TextEditingController();

  String sexoSeleccionado = 'Hombre';
  List<String> padecimientosSeleccionados = [];

  void registrarDatos() {
    final paciente = {
      'nombre': nombreController.text,
      'edad': edadController.text,
      'sexo': sexoSeleccionado,
      'frecuenciaCardiaca': frecuenciaController.text,
      'presionSistolica': presionSistolicaController.text,
      'presionDiastolica': presionDiastolicaController.text,
      'temperatura': temperaturaController.text,
      'padecimientos': padecimientosSeleccionados,
    };

    print('📦 Paciente registrado: $paciente');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          '✅ Paciente registrado con éxito',
          style: TextStyle(fontFamily: 'Comic Sans MS'),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Color(0xff89abe5),
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/principal');
    });
=======
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
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: const Text(''),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildTitle('Datos del Paciente'),
              buildTextFormField('Nombre', nombreController),
              buildTextFormField('Edad', edadController, isNumeric: true),
              buildDropdownField('Sexo', ['Hombre', 'Mujer'],
                  (value) => sexoSeleccionado = value),
              buildTitle('Parámetros Médicos'),
              buildTextFormField('Frecuencia Cardíaca', frecuenciaController,
                  isNumeric: true),
              Row(
                children: [
                  Expanded(
                    child: buildTextFormField(
                      'Presión Sistólica',
                      presionSistolicaController,
                      isNumeric: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: buildTextFormField(
                      'Presión Diastólica',
                      presionDiastolicaController,
                      isNumeric: true,
                    ),
                  ),
                ],
              ),
              buildTextFormField('Temperatura', temperaturaController,
                  isNumeric: true),
              const SizedBox(height: 20),
              buildPadecimientosTable(),
              ElevatedButton(
                onPressed: registrarDatos,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff89abe5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  'Registrar Datos',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'Comic Sans MS'),
                ),
              ),
            ],
          ),
=======
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
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
        ),
      ),
    );
  }

<<<<<<< HEAD
  Widget buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Comic Sans MS'),
      ),
    );
  }

  Widget buildTextFormField(String label, TextEditingController controller,
      {bool isNumeric = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontFamily: 'Comic Sans MS'),
          border: const OutlineInputBorder(),
        ),
=======
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
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
      ),
    );
  }

  Widget buildDropdownField(
<<<<<<< HEAD
      String label, List<String> options, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<String>(
        value: sexoSeleccionado,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontFamily: 'Comic Sans MS'),
          border: const OutlineInputBorder(),
        ),
        items: options
            .map((option) => DropdownMenuItem(
                  value: option,
                  child: Text(
                    option,
                    style: const TextStyle(fontFamily: 'Comic Sans MS'),
                  ),
                ))
            .toList(),
        onChanged: (value) {
          if (value != null) {
            setState(() => onChanged(value));
          }
        },
      ),
    );
  }

  Widget buildPadecimientosTable() {
    final List<String> padecimientos = [
      'Alzheimer',
      'Anemia',
      'Artritis',
      'Asma',
      'Colesterol Alto',
      'Depresión',
      'Demencia',
      'Enfermedad Renal Crónica',
      'EPOC',
      'Gastritis',
      'Hipertensión',
      'Insuficiencia Cardíaca',
      'Migraña',
      'Ninguno',
      'Obesidad',
      'Osteoporosis',
      'Parkinson',
      'Reflujo',
      'Trastorno de Ansiedad',
      'Varices',
    ]..sort();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle('Seleccione Padecimientos'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: padecimientos.map((enfermedad) {
              final bool seleccionado =
                  padecimientosSeleccionados.contains(enfermedad);

              return FilterChip(
                label: Text(
                  enfermedad,
                  style: const TextStyle(fontFamily: 'Comic Sans MS'),
                ),
                selected: seleccionado,
                selectedColor: const Color(0xff89abe5),
                checkmarkColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Colors.black),
                ),
                onSelected: (bool value) {
                  setState(() {
                    if (enfermedad == 'Ninguno') {
                      if (value) {
                        padecimientosSeleccionados
                          ..clear()
                          ..add(enfermedad);
                      } else {
                        padecimientosSeleccionados.remove(enfermedad);
                      }
                    } else {
                      padecimientosSeleccionados.remove('Ninguno');
                      value
                          ? padecimientosSeleccionados.add(enfermedad)
                          : padecimientosSeleccionados.remove(enfermedad);
                    }
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
=======
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
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
    );
  }
}
