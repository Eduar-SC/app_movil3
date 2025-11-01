import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/app_colors.dart';
import '../../viewmodels/patient_viewmodel.dart';
import '../../widgets/patient_drawer.dart';

class PatientHomeView extends StatelessWidget {
  const PatientHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PatientViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.lightBg,
      appBar: AppBar(
        backgroundColor: AppColors.darkBg,
        title: const Text("Inicio"),
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
              // 👋 Bienvenida
              Text(
                "¡Hola, ${vm.name}!",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Tu asistente pulmonar está listo para ayudarte hoy.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 24),

              // 🩺 Tarjeta principal
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.darkBg,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/img2.jpg', // 👈 ícono decorativo
                      width: 90,
                      height: 90,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text(
                        "¿Listo para subir tu nueva radiografía y obtener un análisis rápido?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),

              // 🔹 Botón destacado: Subir Imagen
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/patient/upload');
                  },
                  icon: const Icon(Icons.upload_file),
                  label: const Text("Subir Imagen"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkBg,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),

              // 🧭 Sección: Accesos Rápidos
              const Text(
                "Accesos rápidos",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildQuickCard(
                    context,
                    icon: Icons.analytics,
                    label: "Resultados",
                    route: '/patient/result',
                  ),
                  _buildQuickCard(
                    context,
                    icon: Icons.history,
                    label: "Historial",
                    route: '/patient/history',
                  ),
                  _buildQuickCard(
                    context,
                    icon: Icons.calendar_today,
                    label: "Citas",
                    route: '/patient/appointments',
                  ),
                  _buildQuickCard(
                    context,
                    icon: Icons.chat,
                    label: "Chat Doctor",
                    route: '/patient/chat',
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // 🧠 Sección educativa (extra)
              const Text(
                "Consejo del día",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Text(
                  "Evita fumar y mantén ambientes ventilados. "
                      "Recuerda realizarte controles periódicos de salud pulmonar.",
                  style: TextStyle(fontSize: 15, height: 1.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔸 Tarjeta para accesos rápidos
  Widget _buildQuickCard(BuildContext context, {required IconData icon, required String label, required String route}) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.darkBg, size: 36),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
