import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://192.168.18.16:5000/api";

  static Future<Map<String, dynamic>> registerUser({
    required String nombre,
    required String correo,
    required String contrasena,
    required String tipoUsuario,
    String? telefono,
  }) async {
    final url = Uri.parse('$baseUrl/auth/register');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "nombre": nombre,
          "correo": correo,
          "contrasena": contrasena,
          "tipo_usuario": tipoUsuario,
          "telefono": telefono ?? "",
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        return {
          "error": "Error ${response.statusCode}: ${response.reasonPhrase}",
          "body": response.body
        };
      }
    } catch (e) {
      return {"error": "Error de conexión: $e"};
    }
  }

  static Future<Map<String, dynamic>> loginUser({
    required String correo,
    required String contrasena,
  }) async {
    final url = Uri.parse('$baseUrl/auth/login');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "correo": correo,
          "contrasena": contrasena,
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {
          "error": "Error ${response.statusCode}: ${response.reasonPhrase}",
          "body": response.body
        };
      }
    } catch (e) {
      return {"error": "Error de conexión: $e"};
    }
  }
}
