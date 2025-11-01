import 'package:flutter/material.dart';
import '../data/api/api_service.dart';

class LoginViewModel extends ChangeNotifier {
  bool isLoading = false;

  Future<Map<String, dynamic>> login({
    required String correo,
    required String contrasena,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      final result = await ApiService.loginUser(
        correo: correo,
        contrasena: contrasena,
      );

      isLoading = false;
      notifyListeners();

      if (result.containsKey("error")) {
        return {"error": result["error"]};
      }

      return {
        "tipoUsuario": result["tipoUsuario"] ?? "desconocido",
        "nombre": result["nombre"],
        "idUsuario": result["idUsuario"]
      };
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return {"error": "Error al iniciar sesión: $e"};
    }
  }
}
