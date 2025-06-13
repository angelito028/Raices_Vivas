import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:raices_vivas/bd_raices.dart';
=======
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String? _errorMessage;

<<<<<<< HEAD
  BdRaicesVivas _bdRaices = BdRaicesVivas();
=======
  void _validateAndRegister() {
    setState(() {
      if (_emailController.text.isEmpty ||
          _passwordController.text.isEmpty ||
          _confirmPasswordController.text.isEmpty) {
        _errorMessage = 'Por favor, completa todos los campos.';
      } else if (_passwordController.text != _confirmPasswordController.text) {
        _errorMessage = 'Las contraseñas no coinciden.';
      } else {
        _errorMessage = null;
        Navigator.pushNamed(
          context,
          "/home",
        ); // Cambia según tu flujo de navegación
      }
    });
  }
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Crear cuenta', style: TextStyle(fontSize: 24)),
        backgroundColor: Color(0xffc3b09a),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextField('Correo', controller: _emailController),
              SizedBox(height: 10),
              _buildTextField(
                'Contraseña',
                controller: _passwordController,
                obscureText: true,
              ),
              SizedBox(height: 10),
              _buildTextField(
                'Confirmar contraseña',
                controller: _confirmPasswordController,
                obscureText: true,
              ),
              SizedBox(height: 10),
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              SizedBox(height: 20),
              ElevatedButton(
<<<<<<< HEAD
                onPressed: () async {
                  String correo = _emailController.text.trim();
                  String contrasenia = _passwordController.text.trim();

                  if (correo.isEmpty || contrasenia.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Por favor, completa todos los campos."),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Registrando Usuario..."),
                      duration: Duration(seconds: 1),
                    ),
                  );

                  String? resultado = await _bdRaices.registrarUsuario(
                      correo: correo, contrasenia: contrasenia);

                  if (resultado == null) {
                    // EL REGISTRO FUE EXITOSO =)
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/home", (route) => false);
                  } else {
                    // HUBO UN ERROR EN EL REGISTRO :(
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Error al registrar usuario. $resultado"),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
=======
                onPressed: _validateAndRegister,
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffc6d8f8),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Registrarse',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label, {
    TextEditingController? controller,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontFamily: 'Comic Sans MS'),
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[100],
      ),
    );
  }
}
