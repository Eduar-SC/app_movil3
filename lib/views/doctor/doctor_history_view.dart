import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../widgets/doctor_drawer.dart';

class DoctorHistoryView extends StatelessWidget {
  const DoctorHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final historial = [
      {
        "paciente": "Lucía Torres",
        "fecha": "10 Oct 2025",
        "resultado": "Lesión pulmonar controlada",
        "precision": "89%",
        "observacion": "El paciente respondió bien al tratamiento. Revisión en 3 meses.",
        "imagen": "https://via.placeholder.com/150",
      },
      {
        "paciente": "Carlos López",
        "fecha": "25 Sep 2025",
        "resultado": "Sin anomalías detectadas",
        "precision": "96%",
        "observacion": "Se recomienda control anual preventivo.",
        "imagen": "https://via.placeholder.com/150",
      },
      {
        "paciente": "Eduar Siquita",
        "fecha": "15 Sep 2025",
        "resultado": "Sombra detectada, posible inflamación leve",
        "precision": "81%",
        "observacion": "Requiere seguimiento radiológico.",
        "imagen": "https://via.placeholder.com/150",
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.lightBg,
      appBar: AppBar(
        backgroundColor: AppColors.darkBg,
        foregroundColor: AppColors.lightBg,
        title: const Text("Historial de Pacientes"),
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
              "Historial de estudios realizados",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: InputDecoration(
                hintText: "Buscar paciente o diagnóstico...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black12),
                ),
              ),
            ),
            const SizedBox(height: 24),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: historial.length,
              itemBuilder: (context, index) {
                final h = historial[index];
                return _buildHistoryCard(
                  context,
                  paciente: h["paciente"].toString(),
                  fecha: h["fecha"].toString(),
                  resultado: h["resultado"].toString(),
                  precision: h["precision"].toString(),
                  observacion: h["observacion"].toString(),
                  imagenUrl: h["imagen"].toString(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryCard(
      BuildContext context, {
        required String paciente,
        required String fecha,
        required String resultado,
        required String precision,
        required String observacion,
        required String imagenUrl,
      }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                paciente,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                fecha,
                style: const TextStyle(color: Colors.black54, fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imagenUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      resultado,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Precisión del modelo: $precision",
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          const Text(
            "Observaciones del doctor:",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            observacion,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 14,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 8),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Ver detalles de $paciente (simulado)"),
                  ),
                );
              },
              icon: const Icon(Icons.visibility_outlined),
              label: const Text("Ver detalles"),
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
