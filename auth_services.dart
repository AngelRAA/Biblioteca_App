import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  String? _currentUser;

  // Verificar si hay un usuario autenticado
  bool isAuthenticated() {
    return _currentUser != null;
  }

  // Registrar un nuevo usuario (local)
  Future<void> registerWithEmailPassword(String email, String password) async {
    _currentUser = email; // Guarda el email como "usuario autenticado"
    notifyListeners();
  }

  // Iniciar sesión (local)
  Future<void> signInWithEmailPassword(String email, String password) async {
    _currentUser = email;
    notifyListeners();
  }

  // Cerrar sesión
  Future<void> signOut() async {
    _currentUser = null;
    notifyListeners();
  }

  String? getCurrentUser() {
    return _currentUser;
  }
}
