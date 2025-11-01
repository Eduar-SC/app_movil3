import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../widgets/patient_drawer.dart';

class PatientUploadView extends StatelessWidget {
  const PatientUploadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBg,
      appBar: AppBar(
        backgroundColor: AppColors.darkBg,
        title: const Text("Subir Imagen"),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Selecciona o toma una imagen para analizar",
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 22),

              // 📷 Botones de selección (sin funcionalidad aún)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.camera_alt),
                    label: const Text("Cámara"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkBg,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(140, 45),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.photo_library),
                    label: const Text("Galería"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkBg,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(140, 45),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // 🖼️ Área vacía de vista previa
              Container(
                width: double.infinity,
                height: 240,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Aquí se mostrará la imagen seleccionada",
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // 🔍 Botón Analizar Imagen (sin lógica)
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  label: const Text("Analizar Imagen"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkBg,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // 📊 Sección de resultado (texto de ejemplo)
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
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Resultado del análisis",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Aquí aparecerá el resultado una vez que se haya procesado la imagen.",
                      style: TextStyle(fontSize: 15, height: 1.4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
