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

<<<<<<< HEAD
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const RaicesVivas());
=======
void main() {
  runApp(RaicesVivas());
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
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
<<<<<<< HEAD
        "/home": (context) => Principal(),
=======
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
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
<<<<<<< HEAD
        "/sopa_letras": (context) => const SopaDeLetras(),
=======
        "/sopa_letras": (context) => const SopaDeLetrasScreen(),
        "/boton": (context) => BotonScreen(),
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
      },
      home: Bienvenida(),
    );
  }
}
