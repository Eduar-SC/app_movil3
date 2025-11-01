import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../widgets/doctor_drawer.dart';

class DoctorGuideView extends StatelessWidget {
  const DoctorGuideView({super.key});

  @override
  Widget build(BuildContext context) {
    final secciones = [
      {
        "titulo": "🏠 Inicio",
        "descripcion":
        "Desde la pantalla principal puede visualizar un resumen de sus citas programadas para hoy, junto con alertas importantes o mensajes recientes de los pacientes.",
      },
      {
        "titulo": "🧍‍♂️ Pacientes",
        "descripcion":
        "Aquí encontrará la lista de sus pacientes asignados. Puede ver su diagnóstico más reciente, nivel de riesgo y acceder a su historial o chat directo.",
      },
      {
        "titulo": "🧾 Resultados",
        "descripcion":
        "En esta sección se muestran los resultados de análisis subidos por los pacientes, junto con el diagnóstico preliminar generado por el sistema CNN. Puede validarlos o añadir comentarios médicos.",
      },
      {
        "titulo": "📅 Horarios y Citas",
        "descripcion":
        "Gestione sus horarios disponibles para atención y revise las citas del día. Puede agregar nuevos bloques de tiempo y marcar pacientes como atendidos.",
      },
      {
        "titulo": "💬 Chat",
        "descripcion":
        "Comuníquese directamente con los pacientes mediante mensajes. Use esta función para resolver dudas, coordinar visitas o revisar tratamientos.",
      },
      {
        "titulo": "⚙️ Configuración",
        "descripcion":
        "Personalice su experiencia: idioma, modo oscuro, notificaciones y cierre de sesión. En próximas versiones podrá actualizar su perfil profesional.",
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.lightBg,
      appBar: AppBar(
        backgroundColor: AppColors.darkBg,
        foregroundColor: AppColors.lightBg,
        title: const Text("Guía de Uso"),
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
              "Bienvenido al panel del Doctor",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Aquí encontrará una breve explicación de cada sección para aprovechar al máximo la aplicación Asistente Pulmonar.",
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
            const SizedBox(height: 20),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: secciones.length,
              itemBuilder: (context, index) {
                final item = secciones[index];
                return _buildGuideCard(
                  titulo: item["titulo"]!,
                  descripcion: item["descripcion"]!,
                );
              },
            ),

            const SizedBox(height: 30),

            Center(
              child: Column(
                children: [
                  const Icon(Icons.medical_information,
                      size: 50, color: Colors.black54),
                  const SizedBox(height: 10),
                  Text(
                    "Versión 1.0.0 - Asistente Pulmonar",
                    style: TextStyle(color: Colors.black.withOpacity(0.7)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGuideCard({
    required String titulo,
    required String descripcion,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.08),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: AppColors.darkBg,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            descripcion,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
