import 'package:flutter/material.dart';
import '../data/api/api_service.dart';

class RegisterViewModel extends ChangeNotifier {
  bool isLoading = false;

  Future<String> register({
    required String nombre,
    required String correo,
    required String contrasena,
    required String tipoUsuario,
    String? telefono,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      final result = await ApiService.registerUser(
        nombre: nombre,
        correo: correo,
        contrasena: contrasena,
        tipoUsuario: tipoUsuario,
        telefono: telefono,
      );

      isLoading = false;
      notifyListeners();

      if (result.containsKey('error')) {
        return result['error'] ?? 'Error desconocido del servidor';
      }

      // Si todo fue bien
      return "success";
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return "Error de conexión: $e";
    }
  }
}
