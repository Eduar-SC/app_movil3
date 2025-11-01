import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/app_colors.dart';
import '../../viewmodels/login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<LoginViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.darkBg,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildField(controller: emailController, label: "Correo"),
                    const SizedBox(height: 16),
                    _buildField(controller: passwordController, label: "Contraseña", obscure: true),
                    const SizedBox(height: 28),

                    vm.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () async {
                          final correo = emailController.text.trim();
                          final pass = passwordController.text.trim();

                          if (correo.isEmpty || pass.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Por favor ingresa tus credenciales.'),
                              ),
                            );
                            return;
                          }

                          final result = await vm.login(
                            correo: correo,
                            contrasena: pass,
                          );

                          if (result.containsKey('error')) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(result['error'])),
                            );
                            return;
                          }

                          // ✅ Corregido: el backend devuelve "tipoUsuario"
                          final tipo = result['tipoUsuario'];
                          if (tipo == 'doctor') {
                            Navigator.pushReplacementNamed(context, '/doctor/home');
                          } else if (tipo == 'paciente') {
                            Navigator.pushReplacementNamed(context, '/patient/home');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Tipo de usuario no reconocido')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lightBg,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Iniciar Sesión",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "¿Olvidaste tu contraseña?",
                        style: TextStyle(color: AppColors.lightBg),
                      ),
                    ),

                    const SizedBox(height: 10),
                    Center(
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/register'),
                        child: RichText(
                          text: TextSpan(
                            text: "¿No tienes cuenta? ",
                            style: TextStyle(color: AppColors.lightBg, fontSize: 14),
                            children: const [
                              TextSpan(
                                text: "Crear cuenta",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
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

  Widget _buildHeader(BuildContext context) => Container(
    width: double.infinity,
    height: 140,
    color: AppColors.lightBg,
    child: Stack(
      children: [
        Positioned(
          left: 6,
          top: 10,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
            color: AppColors.darkBg,
          ),
        ),
        const Positioned(
          left: 20,
          bottom: 18,
          child: Text(
            "Bienvenido\nde nuevo",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    bool obscure = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: TextStyle(color: AppColors.textOnDark),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.darkBg,
        labelText: label,
        labelStyle: TextStyle(color: AppColors.lightBg),
        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
      ),
    );
  }
}
