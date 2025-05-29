import 'package:flutter/material.dart';
import './evaluaciones.dart';
import './calculadoras.dart';
import './gericultura.dart';
import './bienvenida.dart';
import "./principal.dart";
import "./registros.dart";
import "./login.dart";
import './alimentacion.dart';
import './crearcuenta.dart';
import './calculadoraIMC.dart';
import './calculadoraPR.dart';
import "./actividades.dart";
import './evaluacion1.dart';
import './sopa.dart';
import './juegos.dart';
import './evaluacion2.dart';
import './memorama.dart';

void main() {
  runApp(RaicesVivas());
}

class RaicesVivas extends StatelessWidget {
  const RaicesVivas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raíces Vivas',
      theme: ThemeData(primarySwatch: Colors.green),
      routes: {
        "/login": (context) => const LoginScreen(),
        "/principal": (context) => Principal(),
        "/gericultura": (context) => GericulturaScreen(),
        "/calculadoras": (context) => Calculadoras(),
        "/registros": (context) => RegistroUsuariosScreen(),
        "/alimentacion": (context) => PantallaAlimentacion(),
        "/crearcuenta": (context) => RegisterScreen(),
        "/calculadora_IMC": (context) => CalculadoraIMC(),
        "/calculadoraPR": (context) => CalculadoraPresionYRitmo(),
        "/actividades": (context) => EjerciciosScreen(),
        "/evaluaciones": (context) => EvaluacionesScreen(),
        "/evaluacion1": (context) => Evaluacion1(),
        "/evaluacion2": (context) => Evaluacion2(),
        "/juegos": (context) => const JuegosScreen(),
        "/memorama": (context) => const MemoramaScreen(),
        "/sopa_letras": (context) => const SopaDeLetrasScreen(),
        "/boton": (context) => BotonScreen(),
      },
      home: Bienvenida(),
    );
  }
}
