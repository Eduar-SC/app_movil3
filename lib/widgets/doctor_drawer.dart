import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class DoctorDrawer extends StatelessWidget {
  const DoctorDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🧑‍⚕️ Encabezado del Drawer
            Container(
              width: double.infinity,
              color: AppColors.darkBg,
              padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 18),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.black54, size: 28),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Doctor",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Siquita Eduar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // 📋 Opciones del menú
            Expanded(
              child: Container(
                color: const Color(0xFFe5e5e5),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildMenuItem(context, Icons.home_outlined, "Inicio", "/doctor/home"),
                    _buildMenuItem(context, Icons.group_outlined, "Pacientes", "/doctor/patients"),
                    _buildMenuItem(context, Icons.cloud_upload_outlined, "Subir imagen", "/doctor/upload"),
                    _buildMenuItem(context, Icons.chat_bubble_outline, "Chat paciente-doctor", "/doctor/chat"),
                    _buildMenuItem(context, Icons.settings_outlined, "Configuración", "/doctor/settings"),
                    _buildMenuItem(context, Icons.help_outline, "Guía de uso", "/doctor/guide"),
                  ],
                ),
              ),
            ),

            // 🚪 Botón de Cerrar sesión
            Container(
              color: Colors.grey[400],
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.black87),
                title: const Text(
                  "Cerrar Sesión",
                  style: TextStyle(color: Colors.black87),
                ),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Método auxiliar para los ítems
  Widget _buildMenuItem(BuildContext context, IconData icon, String text, String route) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(
        text,
        style: const TextStyle(color: Colors.black87, fontSize: 15),
      ),
      onTap: () {
        Navigator.pop(context); // cierra el Drawer
        Navigator.pushNamed(context, route);
      },
    );
  }
}
