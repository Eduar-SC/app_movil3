import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../widgets/doctor_drawer.dart';

class DoctorSettingsView extends StatefulWidget {
  const DoctorSettingsView({super.key});

  @override
  State<DoctorSettingsView> createState() => _DoctorSettingsViewState();
}

class _DoctorSettingsViewState extends State<DoctorSettingsView> {
  bool notificaciones = true;
  bool modoOscuro = false;
  String idioma = "Español";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBg,
      appBar: AppBar(
        backgroundColor: AppColors.darkBg,
        foregroundColor: AppColors.lightBg,
        title: const Text("Configuración"),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: const DoctorDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Preferencias del Doctor",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // 🔔 Notificaciones
            SwitchListTile(
              value: notificaciones,
              onChanged: (v) {
                setState(() => notificaciones = v);
              },
              activeColor: AppColors.darkBg,
              title: const Text("Notificaciones"),
              subtitle:
              const Text("Recibir alertas sobre nuevas citas o mensajes"),
            ),
            const Divider(),

            // 🌙 Modo oscuro
            SwitchListTile(
              value: modoOscuro,
              onChanged: (v) {
                setState(() => modoOscuro = v);
              },
              activeColor: AppColors.darkBg,
              title: const Text("Modo oscuro"),
              subtitle: const Text("Cambia el tema de la aplicación"),
            ),
            const Divider(),

            // 🌎 Idioma
            ListTile(
              title: const Text("Idioma"),
              subtitle: Text(idioma),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => _mostrarSelectorIdioma(context),
            ),
            const Divider(),

            // 👨‍⚕️ Datos del perfil
            ListTile(
              title: const Text("Editar perfil"),
              leading: const Icon(Icons.person_outline),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Función de edición de perfil próximamente"),
                  ),
                );
              },
            ),
            const Divider(),

            // 🗑️ Cerrar sesión
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  _mostrarConfirmacionLogout(context);
                },
                icon: const Icon(Icons.logout),
                label: const Text("Cerrar sesión"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🌍 Selector de idioma
  void _mostrarSelectorIdioma(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.lightBg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Seleccionar idioma",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text("Español"),
                onTap: () {
                  setState(() => idioma = "Español");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Inglés"),
                onTap: () {
                  setState(() => idioma = "Inglés");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Portugués"),
                onTap: () {
                  setState(() => idioma = "Portugués");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // 🔒 Confirmación de cierre de sesión
  void _mostrarConfirmacionLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Cerrar sesión"),
        content: const Text(
            "¿Está seguro que desea cerrar sesión? Se perderá el progreso actual."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/login');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.darkBg,
              foregroundColor: Colors.white,
            ),
            child: const Text("Cerrar sesión"),
          ),
        ],
      ),
    );
  }
}
