import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../widgets/patient_drawer.dart';

class PatientInfoView extends StatelessWidget {
  const PatientInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBg,
      appBar: AppBar(
        backgroundColor: AppColors.darkBg,
        title: const Text("Información sobre Cáncer Pulmonar"),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: const PatientDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          color: AppColors.lightBg,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🫁 Título principal
              const Text(
                "Cáncer de Pulmón",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "El cáncer de pulmón es una enfermedad en la que las células del pulmón "
                    "crecen de forma descontrolada. Es uno de los tipos de cáncer más comunes "
                    "y una de las principales causas de muerte relacionada con el cáncer en el mundo.",
                style: TextStyle(fontSize: 15, height: 1.6),
              ),
              const SizedBox(height: 24),

              // 🔹 Sección: Tipos
              _buildSectionTitle("Tipos de cáncer de pulmón"),
              const Text(
                "• Cáncer de pulmón de células no pequeñas (CPCNP): representa alrededor del 85% de los casos.\n"
                    "• Cáncer de pulmón de células pequeñas (CPCP): crece más rápido y suele estar relacionado con el tabaquismo.",
                style: TextStyle(fontSize: 15, height: 1.6),
              ),
              const SizedBox(height: 24),

              // ⚠️ Sección: Síntomas
              _buildSectionTitle("Síntomas comunes"),
              const Text(
                "• Tos persistente o con sangre\n"
                    "• Dolor en el pecho al respirar o toser\n"
                    "• Dificultad para respirar\n"
                    "• Ronquera o pérdida de voz\n"
                    "• Pérdida de peso sin causa aparente\n"
                    "• Fatiga constante",
                style: TextStyle(fontSize: 15, height: 1.6),
              ),
              const SizedBox(height: 24),

              // ☣️ Sección: Causas y factores de riesgo
              _buildSectionTitle("Causas y factores de riesgo"),
              const Text(
                "• Tabaquismo (principal causa)\n"
                    "• Exposición prolongada al humo de segunda mano\n"
                    "• Contaminación del aire\n"
                    "• Exposición al gas radón o al asbesto\n"
                    "• Factores genéticos y antecedentes familiares",
                style: TextStyle(fontSize: 15, height: 1.6),
              ),
              const SizedBox(height: 24),

              // 🛡️ Sección: Prevención
              _buildSectionTitle("Prevención"),
              const Text(
                "• No fumar y evitar el humo del tabaco\n"
                    "• Realizar chequeos médicos periódicos\n"
                    "• Mantener una dieta saludable rica en frutas y verduras\n"
                    "• Evitar la exposición a sustancias tóxicas y ambientes contaminados\n"
                    "• Hacer ejercicio regularmente",
                style: TextStyle(fontSize: 15, height: 1.6),
              ),
              const SizedBox(height: 24),

              // 🧬 Sección: Tratamientos
              _buildSectionTitle("Tratamientos disponibles"),
              const Text(
                "Los tratamientos dependen del tipo y la etapa del cáncer. Pueden incluir:\n"
                    "• Cirugía para extirpar tumores\n"
                    "• Radioterapia para destruir células cancerosas\n"
                    "• Quimioterapia\n"
                    "• Inmunoterapia o terapias dirigidas para fortalecer el sistema inmunológico",
                style: TextStyle(fontSize: 15, height: 1.6),
              ),
              const SizedBox(height: 24),

              // 💡 Recomendación final
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Text(
                  "💡 Consejo: Si presentas síntomas persistentes o tienes antecedentes familiares, "
                      "consulta a tu médico. La detección temprana mejora significativamente las posibilidades de tratamiento exitoso.",
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.6,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // 🧱 Widget auxiliar para subtítulos
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
