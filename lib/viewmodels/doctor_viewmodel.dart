import 'package:flutter/foundation.dart';

class DoctorViewModel extends ChangeNotifier {
  // 🔹 Datos básicos del doctor (luego vendrán del backend)
  String nombre = "Siquita Eduar";
  String especialidad = "Neumología";

  // 🔹 Lista temporal de citas del día
  List<Map<String, dynamic>> citasHoy = [
    {"paciente": "Lucía Torres", "hora": "9:00 AM"},
    {"paciente": "Carlos López", "hora": "10:30 AM"},
    {"paciente": "Eduar Siquita", "hora": "11:45 AM"},
  ];

  // 🔹 Ejemplo de cambio de estado (simulación)
  void actualizarNombre(String nuevoNombre) {
    nombre = nuevoNombre;
    notifyListeners();
  }

  // 🔹 Simulación de carga de datos (para futuro backend)
  Future<void> cargarDatosDoctor() async {
    await Future.delayed(const Duration(seconds: 2));
    // Aquí iría una llamada HTTP al backend Python (FastAPI o Flask)
    notifyListeners();
  }
}
