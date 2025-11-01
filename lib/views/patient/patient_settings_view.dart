import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../widgets/patient_drawer.dart';

class PatientSettingsView extends StatelessWidget {
  const PatientSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    bool darkMode = false; // luego vendrá del ViewModel o preferencia guardada

    return Scaffold(
      backgroundColor: AppColors.lightBg,
      appBar: AppBar(
        backgroundColor: AppColors.darkBg,
        title: const Text("Configuración"),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: const PatientDrawer(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: AppColors.lightBg,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 👤 Sección de perfil
              const Text(
                "Perfil del usuario",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.black54, size: 32),
                ),
                title: const Text(
                  "Eduar Siquita",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                subtitle: const Text("Paciente - eduar@gmail.com"),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {},
                  tooltip: "Editar perfil",
                ),
              ),

              const SizedBox(height: 28),

              // ⚙️ Preferencias
              const Text(
                "Preferencias",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    SwitchListTile(
                      title: const Text("Modo oscuro"),
                      value: darkMode,
                      activeColor: AppColors.darkBg,
                      onChanged: (value) {
                        // luego cambiará el tema de la app
                      },
                    ),
                    const Divider(height: 0),
                    ListTile(
                      title: const Text("Idioma"),
                      subtitle: const Text("Español"),
                      trailing: const Icon(Icons.language),
                      onTap: () {
                        // luego mostrará selector de idioma
                      },
                    ),
                    const Divider(height: 0),
                    ListTile(
                      title: const Text("Notificaciones"),
                      subtitle: const Text("Activadas"),
                      trailing: const Icon(Icons.notifications_active_outlined),
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // 📄 Información y políticas
              const Text(
                "Información",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.info_outline),
                      title: const Text("Acerca de la aplicación"),
                      onTap: () {},
                    ),
                    const Divider(height: 0),
                    ListTile(
                      leading: const Icon(Icons.privacy_tip_outlined),
                      title: const Text("Política de privacidad"),
                      onTap: () {},
                    ),
                    const Divider(height: 0),
                    ListTile(
                      leading: const Icon(Icons.article_outlined),
                      title: const Text("Términos y condiciones"),
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // 🚪 Cerrar sesión
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // luego cerrará sesión y redirigirá al login
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text("Cerrar Sesión"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Versión 1.0.0 © 2025 Crazy Shoes Labs",
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
