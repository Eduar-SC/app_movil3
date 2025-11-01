import 'package:flutter/material.dart';

class PatientViewModel extends ChangeNotifier {
  // Datos del paciente (ejemplo)
  String name = "Richard Aguilar";
  String role = "paciente";
  String? avatarAsset = 'assets/images/avatar.png';

  // Ejemplo: lista de historiales (placeholder)
  final List<Map<String, String>> history = [
    {"date": "2025-10-10", "result": "Riesgo medio - 83%"},
    {"date": "2025-09-25", "result": "Riesgo bajo - 91%"},
  ];

  // Acciones
  void logout() {
    // aquí borras token, limpiar estado y notificar
    // por ahora solo notifica
    debugPrint("Logout");
    // notifyListeners(); // usar si cambias estado
  }

  void updateName(String newName) {
    name = newName;
    notifyListeners();
  }
}
