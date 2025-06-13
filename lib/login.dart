import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:raices_vivas/bd_raices.dart';
=======
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

<<<<<<< HEAD
  BdRaicesVivas _bdRaices = BdRaicesVivas();
=======
  void _validateAndLogin() {
    setState(() {
      String email = _emailController.text.trim();
      String password = _passwordController.text;

      if (email.isEmpty || password.isEmpty) {
        _errorMessage = 'Por favor, ingresa tu correo y contraseña.';
      } else if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email)) {
        _errorMessage = 'Correo inválido.';
      } else {
        _errorMessage = null;
        // Navegación sin posibilidad de regresar con la flechita
        Navigator.pushReplacementNamed(context, "/principal");
      }
    });
  }

  void _navigateToRegister() {
    Navigator.pushNamed(context, "/register");
  }
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          '',
          style: TextStyle(
            color: Color(0xfff2e8de),
            fontFamily: 'Comic Sans MS',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xffe2d1c3),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFf5e9dc), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                    boxShadow: const [
                      BoxShadow(color: Colors.black26, blurRadius: 8),
                    ],
                  ),
                  child: Icon(Icons.person, size: 90, color: Colors.grey[600]),
                ),
                const SizedBox(height: 20),
                _buildTextField('Correo', controller: _emailController),
                const SizedBox(height: 10),
                _buildTextField(
                  'Contraseña',
                  controller: _passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                if (_errorMessage != null)
                  Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  ),
                const SizedBox(height: 20),

                // Botón estilizado con sombra
                Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                        blurRadius: 6,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: ElevatedButton(
                      onPressed: () async {
                        String correo = _emailController.text.trim();
                        String contrasenia = _passwordController.text.trim();

                        if (correo.isEmpty || contrasenia.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text("Por favor, completa todos los campos."),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                        } else {
                          String? resultado = await _bdRaices.loginUsuario(
                            correo: correo,
                            contrasenia: contrasenia,
                          );

                          if (resultado == null) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, "/principal", (route) => false);
                          } else {
                            String mensajeError = "";

                            switch (resultado) {
                              case "The email address is badly formatted.":
                                mensajeError =
                                    "El correo no tiene un formato válido.";
                                break;
                              case "There is no user record corresponding to this identifier. The user may have been deleted.":
                                mensajeError =
                                    "El usuario no existe. Verifica el correo.";
                                break;
                              case "The password is invalid or the user does not have a password.":
                                mensajeError = "La contraseña es incorrecta.";
                                break;
                              case "A network error (such as timeout, interrupted connection or unreachable host) has occurred.":
                                mensajeError =
                                    "Error de red. Revisa tu conexión a internet.";
                                break;
                              default:
                                mensajeError =
                                    "Error al iniciar sesión. Intenta de nuevo.";
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(mensajeError),
                                backgroundColor: Colors.redAccent,
                              ),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff89abe5),
                        fixedSize: const Size(220, 60),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                      child: const Text(
                        'Iniciar',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Comic Sans MS',
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/crearcuenta");
                  },
                  child: const Text(
                    'Crear cuenta nueva',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      fontFamily: 'Comic Sans MS',
                    ),
                  ),
                ),
              ],
            ),
=======
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        automaticallyImplyLeading: false, // <- Elimina la flechita de regreso
        title: Text('Raíces Vivas', style: TextStyle(fontSize: 24)),
        backgroundColor: Color(0xffc3b09a),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
                ),
                child: Icon(Icons.person, size: 90, color: Colors.grey[600]),
              ),
              SizedBox(height: 20),
              _buildTextField('Correo', controller: _emailController),
              SizedBox(height: 10),
              _buildTextField(
                'Contraseña',
                controller: _passwordController,
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
                onPressed: _validateAndLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff89abe5),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Iniciar',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/crearcuenta");
                },
                child: Text(
                  'Crear cuenta nueva',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff4a4a4a),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
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
<<<<<<< HEAD
        labelStyle: const TextStyle(color: Colors.black),
=======
>>>>>>> 843e62b68c3ffb619663bd11e1d7194fd0185c0f
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[100],
      ),
    );
  }
}
