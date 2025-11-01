import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../widgets/patient_drawer.dart';

class PatientHistoryView extends StatelessWidget {
  const PatientHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    // 📋 Datos simulados (más adelante vendrán del backend)
    final List<Map<String, dynamic>> analisis = [
      {
        "fecha": "15 de octubre de 2025",
        "resultado": "Sin indicios de cáncer pulmonar",
        "riesgo": "Bajo",
        "doctor": "Dr. Carlos Pérez",
      },
      {
        "fecha": "8 de septiembre de 2025",
        "resultado": "Posibles opacidades en pulmón derecho",
        "riesgo": "Medio",
        "doctor": "Dra. Mariana Torres",
      },
      {
        "fecha": "20 de agosto de 2025",
        "resultado": "Lesión sospechosa en lóbulo inferior izquierdo",
        "riesgo": "Alto",
        "doctor": "Dr. José Ramos",
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.lightBg,
      appBar: AppBar(
        backgroundColor: AppColors.darkBg,
        title: const Text("Historial de Análisis"),
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
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Resultados anteriores",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 18),

              // 🔹 Lista de resultados
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: analisis.length,
                itemBuilder: (context, index) {
                  final a = analisis[index];
                  return _buildResultCard(
                    fecha: a["fecha"],
                    resultado: a["resultado"],
                    riesgo: a["riesgo"],
                    doctor: a["doctor"],
                  );
                },
              ),

              const SizedBox(height: 30),

              // 📊 Botón para ver estadísticas
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Luego abrirá estadísticas o gráficos
                  },
                  icon: const Icon(Icons.bar_chart_outlined),
                  label: const Text("Ver estadísticas de análisis"),
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
                  "Los análisis mostrados son resultados generados por IA.\nConsulte siempre a su médico de confianza.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔸 Tarjeta de resultado
  Widget _buildResultCard({
    required String fecha,
    required String resultado,
    required String riesgo,
    required String doctor,
  }) {
    Color riesgoColor;
    switch (riesgo.toLowerCase()) {
      case "alto":
        riesgoColor = Colors.redAccent;
        break;
      case "medio":
        riesgoColor = Colors.orangeAccent;
        break;
      default:
        riesgoColor = Colors.green;
    }

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
          // Fecha y nivel de riesgo
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                fecha,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: riesgoColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Riesgo: $riesgo",
                  style: TextStyle(
                    color: riesgoColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Resultado principal
          Text(
            resultado,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 8),

          // Doctor asociado
          Row(
            children: [
              const Icon(Icons.person_outline, size: 18, color: Colors.black54),
              const SizedBox(width: 6),
              Text(
                doctor,
                style: const TextStyle(color: Colors.black87, fontSize: 14),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Botón de ver detalle
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () {
                // luego abrirá pantalla de detalle del análisis
              },
              icon: const Icon(Icons.visibility_outlined),
              label: const Text("Ver detalle"),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.darkBg,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
