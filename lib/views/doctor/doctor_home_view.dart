import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../widgets/doctor_drawer.dart';

class DoctorHomeView extends StatelessWidget {
  const DoctorHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final citasHoy = [
      {"paciente": "Richard Aguilar", "hora": "09:00 AM", "motivo": "Revisión pulmonar"},
      {"paciente": "Lucía Torres", "hora": "10:30 AM", "motivo": "Control post análisis"},
    ];

    final analisisPendientes = [
      {"paciente": "Carlos López", "fecha": "22 Oct 2025"},
      {"paciente": "María Rivera", "fecha": "21 Oct 2025"},
    ];

    return Scaffold(
      backgroundColor: AppColors.lightBg,
      appBar: AppBar(
        backgroundColor: AppColors.darkBg,
        foregroundColor: AppColors.lightBg,
        title: const Text("Panel del Doctor"),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: const DoctorDrawer(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Bienvenido, Doctor 👨‍⚕️",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Aquí tiene un resumen de su actividad reciente.",
                style: TextStyle(color: Colors.black54, fontSize: 15),
              ),
              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      icon: Icons.calendar_today_outlined,
                      title: "Citas Hoy",
                      value: citasHoy.length.toString(),
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: _buildStatCard(
                      icon: Icons.analytics_outlined,
                      title: "Análisis Pendientes",
                      value: analisisPendientes.length.toString(),
                      color: Colors.orangeAccent,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              const Text(
                "Citas programadas para hoy",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              citasHoy.isEmpty
                  ? const Text("No tiene citas programadas para hoy.")
                  : Column(
                children: citasHoy
                    .map((c) => _buildAppointmentCard(
                  paciente: c["paciente"]!,
                  hora: c["hora"]!,
                  motivo: c["motivo"]!,
                ))
                    .toList(),
              ),

              const SizedBox(height: 30),

              const Text(
                "Análisis pendientes de revisión",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              analisisPendientes.isEmpty
                  ? const Text("No hay análisis pendientes.")
                  : Column(
                children: analisisPendientes
                    .map((a) => _buildAnalysisCard(
                  paciente: a["paciente"]!,
                  fecha: a["fecha"]!,
                ))
                    .toList(),
              ),

              const SizedBox(height: 30),

              const Text(
                "Accesos rápidos",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 14),

              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _buildQuickAccess(
                    context,
                    icon: Icons.analytics_outlined,
                    label: "Revisar análisis",
                    route: "/doctor/analysis",
                    color: Colors.orangeAccent,
                  ),
                  _buildQuickAccess(
                    context,
                    icon: Icons.calendar_month_outlined,
                    label: "Citas médicas",
                    route: "/doctor/appointments",
                    color: Colors.blueAccent,
                  ),
                  _buildQuickAccess(
                    context,
                    icon: Icons.chat_bubble_outline,
                    label: "Chat pacientes",
                    route: "/doctor/chat",
                    color: Colors.green,
                  ),
                  _buildQuickAccess(
                    context,
                    icon: Icons.settings_outlined,
                    label: "Configuración",
                    route: "/doctor/settings",
                    color: Colors.grey,
                  ),
                ],
              ),

              const SizedBox(height: 40),
              const Center(
                child: Text(
                  "Última sincronización: 23 Oct 2025 - 09:30 AM",
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.08),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: color.withOpacity(0.15),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.black54, fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAppointmentCard({
    required String paciente,
    required String hora,
    required String motivo,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          const Icon(Icons.access_time, color: Colors.black54, size: 28),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$paciente - $hora",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Text(
                  motivo,
                  style: const TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, size: 18),
            onPressed: () {
              // Abrir detalle de la cita
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAnalysisCard({
    required String paciente,
    required String fecha,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          const Icon(Icons.image_search_outlined, color: Colors.black54, size: 28),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  paciente,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Text(
                  "Subido el $fecha",
                  style: const TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.visibility_outlined, size: 22),
            onPressed: () {

            },
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAccess(BuildContext context,
      {required IconData icon,
        required String label,
        required String route,
        required Color color}) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.05),
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: color.withOpacity(0.15),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
