import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      body: SafeArea(
        child: Column(
          children: [
            // 🔹 Imagen médica en la parte superior
            Expanded(
              flex: 6,
              child: Stack(
                children: [
                  // Imagen decorativa
                  SizedBox.expand(
                    child: Image.asset(
                      'assets/img1.jpg', // 👈 tu imagen
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Sombra sutil para contraste del texto
                  Container(color: Colors.black.withOpacity(0.25)),
                  // Texto principal sobre la imagen
                  Positioned(
                    left: 20,
                    top: 30,
                    right: 20,
                    child: Text(
                      "Bienvenido a tu asistente de salud pulmonar",
                      style: TextStyle(
                        color: AppColors.lightBg,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 🔹 Panel inferior blanco curvo
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    // Fondo claro con esquinas redondeadas
                    Container(
                      decoration: const BoxDecoration(
                        color: AppColors.lightBg,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(8),
                        ),
                      ),
                    ),

                    // Contenido del panel
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            "\"Tu salud en tus manos - Diagnóstico inteligente al alcance de todos\"",
                            style: TextStyle(
                              color: AppColors.darkBg,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Botón oscuro: Iniciar sesión
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () => Navigator.pushNamed(context, '/login'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.darkBg,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                "Iniciar Sesión",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Botón claro: Crear cuenta
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () => Navigator.pushNamed(context, '/register'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.lightBg,
                                foregroundColor: Colors.black, // texto negro
                                side: BorderSide(color: AppColors.darkBg, width: 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                "Crear Cuenta",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
