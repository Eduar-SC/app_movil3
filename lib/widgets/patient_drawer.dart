import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/app_colors.dart';
import '../viewmodels/patient_viewmodel.dart';

class PatientDrawer extends StatelessWidget {
  const PatientDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PatientViewModel>(context);

    return Drawer(
      child: Column(
        children: [
          // 🧑‍🔬 Encabezado con datos del paciente
          Container(
            width: double.infinity,
            color: AppColors.darkBg,
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage(vm.avatarAsset ?? 'assets/images/avatar.png'),
                  backgroundColor: Colors.white24,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vm.role,
                      style: const TextStyle(color: AppColors.lightBg, fontSize: 12),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      vm.name,
                      style: const TextStyle(
                        color: AppColors.lightBg,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 📋 Menú principal
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildItem(context, icon: Icons.home, label: "Inicio", route: '/patient/home'),
                _buildItem(context, icon: Icons.upload_file, label: "Subir Imagen", route: '/patient/upload'),
                _buildItem(context, icon: Icons.history, label: "Historial", route: '/patient/history'),
                _buildItem(context, icon: Icons.info, label: "Informate", route: '/patient/info'),
                _buildItem(context, icon: Icons.chat, label: "Chat paciente - doctor", route: '/patient/chat'),
                _buildItem(context, icon: Icons.settings, label: "Configuración", route: '/patient/settings'),
                _buildItem(context, icon: Icons.book, label: "Guía de uso", route: '/patient/guide'),
              ],
            ),
          ),

          // 🚪 Cerrar sesión
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightBg,
                  foregroundColor: Colors.black,
                  minimumSize: const Size.fromHeight(44),
                ),
                onPressed: () {
                  vm.logout();
                  Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
                },
                child: const Text("Cerrar Sesión"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Constructor de los ítems del menú
  Widget _buildItem(BuildContext context, {required IconData icon, required String label, required String route}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(label),
      onTap: () {
        Navigator.of(context).pop(); // cerrar drawer
        Navigator.of(context).pushNamed(route);
      },
    );
  }
}
