import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../widgets/patient_drawer.dart';

class PatientGuideView extends StatelessWidget {
  const PatientGuideView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBg,
      appBar: AppBar(
        backgroundColor: AppColors.darkBg,
        title: const Text("Guía de Uso"),
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
              const Text(
                "Bienvenido a la App de Diagnóstico Pulmonar 🫁",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Esta guía te ayudará a entender cómo usar cada función de la aplicación para aprovechar al máximo sus beneficios.",
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
              const SizedBox(height: 24),

              _buildStep(
                icon: Icons.login,
                title: "1. Inicia sesión o regístrate",
                text:
                "Crea una cuenta o inicia sesión como paciente o doctor. Usa tu correo electrónico y contraseña registrados.",
              ),

              _buildStep(
                icon: Icons.cloud_upload_outlined,
                title: "2. Sube una imagen de tu radiografía",
                text:
                "Ve a la sección 'Subir imagen'. Elige una imagen desde tu galería o toma una foto con tu cámara. "
                    "Asegúrate de que sea una radiografía clara de tus pulmones.",
              ),

              _buildStep(
                icon: Icons.analytics_outlined,
                title: "3. Analiza los resultados",
                text:
                "La aplicación procesará la imagen con inteligencia artificial y te mostrará un análisis del posible estado de tus pulmones. "
                    "Si se detecta alguna anomalía, se te recomendará una consulta médica.",
              ),

              _buildStep(
                icon: Icons.calendar_today_outlined,
                title: "4. Agenda una cita con tu doctor",
                text:
                "En la sección 'Citas médicas', selecciona tu doctor y el horario disponible. "
                    "Podrás ver los días y horas en los que tu especialista atiende.",
              ),

              _buildStep(
                icon: Icons.chat_bubble_outline,
                title: "5. Comunícate con tu doctor",
                text:
                "Usa el chat integrado para hablar directamente con tu médico, resolver dudas o seguir indicaciones de tratamiento.",
              ),

              _buildStep(
                icon: Icons.health_and_safety_outlined,
                title: "6. Aprende sobre la salud pulmonar",
                text:
                "En la sección 'Información médica' encontrarás datos sobre síntomas, prevención y causas comunes del cáncer pulmonar.",
              ),

              const SizedBox(height: 28),

              // 🔹 Sección de consejos
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "💡 Consejos importantes",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "• Sube solo imágenes médicas claras y recientes.\n"
                          "• Los resultados son orientativos, no reemplazan una evaluación médica profesional.\n"
                          "• Mantén tus datos actualizados y seguros.\n"
                          "• Si presentas síntomas graves, acude a un centro médico de inmediato.",
                      style: TextStyle(fontSize: 15, height: 1.5),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // 📘 Enlace a tutorial o PDF
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Luego abrirá PDF o tutorial en web
                  },
                  icon: const Icon(Icons.picture_as_pdf_outlined),
                  label: const Text("Ver guía completa en PDF"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkBg,
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
                  "Última actualización: Octubre 2025",
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Widget reutilizable para cada paso
  Widget _buildStep({
    required IconData icon,
    required String title,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.darkBg,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  text,
                  style: const TextStyle(fontSize: 15, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
