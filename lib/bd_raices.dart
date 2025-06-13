import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BdRaicesVivas {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // GUARDA LA SESIÓN ACTIVA
  Future<void> guardarSesionActiva(String uid) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('logueado', true);
    await prefs.setString('uid', uid);
  }

  // REGISTRAR USUARIO
  Future<String?> registrarUsuario({
    required String correo,
    required String contrasenia,
  }) async {
    try {
      // CREARÁ UN USUARIO EN FIREBASE AUTHENTICATION
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: correo, password: contrasenia);

      // GUARDARÁ EL NOMBRE DEL USUARIO EN UNA FIRESTORE
      await _firestore
          .collection('usuarios')
          .doc(userCredential.user!.uid)
          .set({
        'correo_electronico': correo,
        'fecha_registro': FieldValue.serverTimestamp(),
      });

      await guardarSesionActiva(_auth.currentUser!.uid);

      return null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return 'El correo ya está en uso.';
        case 'weak-password':
          return 'La contraseña es muy débil.';
        case 'user-not-found':
          return 'Usuario no encontrado.';
        case 'wrong-password':
          return 'Contraseña incorrecta.';
        default:
          return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  // INICIAR SESIÓN
  Future<String?> loginUsuario({
    required String correo,
    required String contrasenia,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: correo, password: contrasenia);

      await guardarSesionActiva(_auth.currentUser!.uid);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  // OBTENER DATOS ACTUALES DEL USUARIO LOGGEADO
  Future<Map<String, dynamic>?> datosActualesUsuario() async {
    User? usuario = _auth.currentUser;
    if (usuario == null) return null;

    DocumentSnapshot doc =
        await _firestore.collection('usuarios').doc(usuario.uid).get();

    return doc.data() as Map<String, dynamic>;
  }

  // CERRAR SESIÓN
  Future<void> cerrarSesion() async {
    await _auth.signOut();

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('logueado');
    await prefs.remove('uid');
  }

  // RECUPERAR CONTRASEÑA =)
  Future<String?> recuperarContrasenia(String correo) async {
    try {
      await _auth.sendPasswordResetEmail(email: correo);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return "Error desconocido al enviar el correo.";
    }
  }
}
