import 'package:flutter/material.dart';

class RegistroUsuariosScreen extends StatefulWidget {
  const RegistroUsuariosScreen({super.key});

  @override
  State<RegistroUsuariosScreen> createState() => _RegistroUsuariosScreenState();
}

class _RegistroUsuariosScreenState extends State<RegistroUsuariosScreen> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController edadController = TextEditingController();
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        ),
      ),
    );
  }

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
      ),
    );
  }

  Widget buildDropdownField(
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
    );
  }
}
