import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../widgets/doctor_drawer.dart';

class DoctorUploadView extends StatelessWidget {
  const DoctorUploadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBg,
      appBar: AppBar(
        backgroundColor: AppColors.darkBg,
        foregroundColor: AppColors.lightBg,
        title: const Text("Subir Imagen"),
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
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                "Subir radiografía o tomografía del paciente",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 24),

              // 🩻 Contenedor de imagen
              Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.08),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cloud_upload_outlined,
                      size: 60,
                      color: AppColors.darkBg,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Toca para seleccionar una imagen",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 26),

              // 📋 Datos del paciente
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Seleccionar paciente",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                items: const [
                  DropdownMenuItem(
                      value: "lucia", child: Text("Lucía Torres")),
                  DropdownMenuItem(
                      value: "carlos", child: Text("Carlos López")),
                  DropdownMenuItem(
                      value: "eduar", child: Text("Eduar Siquita")),
                ],
                onChanged: (v) {},
                hint: const Text("Selecciona un paciente"),
              ),

              const SizedBox(height: 22),

              // 🧾 Descripción
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "Descripción o notas del estudio",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // 🔘 Botón principal
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Imagen subida correctamente (simulado)"),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkBg,
                    foregroundColor: AppColors.lightBg,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.upload_file),
                  label: const Text(
                    "Subir imagen",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}