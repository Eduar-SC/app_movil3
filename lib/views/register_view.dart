import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/app_colors.dart';
import '../../viewmodels/register_viewmodel.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final nombreCtrl = TextEditingController();
  final correoCtrl = TextEditingController();
  final telefonoCtrl = TextEditingController();
  final contrasenaCtrl = TextEditingController();
  String? _selectedUserType;

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<RegisterViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.darkBg,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                child: Column(
                  children: [
                    _buildField("Nombre Completo", controller: nombreCtrl),
                    const SizedBox(height: 14),
                    _buildField("Correo", controller: correoCtrl),
                    const SizedBox(height: 14),
                    _buildField("Teléfono", controller: telefonoCtrl),
                    const SizedBox(height: 14),
                    _buildField("Contraseña", controller: contrasenaCtrl, obscure: true),
                    const SizedBox(height: 14),
                    _buildDropdown(),
                    const SizedBox(height: 26),

                    vm.isLoading
                        ? const CircularProgressIndicator()
                        : SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_selectedUserType == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Selecciona un tipo de usuario")),
                            );
                            return;
                          }

                          final result = await vm.register(
                            nombre: nombreCtrl.text,
                            correo: correoCtrl.text,
                            contrasena: contrasenaCtrl.text,
                            tipoUsuario: _selectedUserType!,
                          );

                          if (result == "success") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Registro exitoso")),
                            );
                            if (_selectedUserType == "doctor") {
                              Navigator.pushNamed(context, '/doctor/register_details');
                            } else {
                              Navigator.pushNamed(context, '/patient/home');
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(result)),
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
                        child: const Text("Registrar"),
                      ),
                    ),

                    const SizedBox(height: 14),
                    _buildLoginLink(context),
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
            "Crea tu\ncuenta",
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

  Widget _buildField(String label,
      {bool obscure = false, TextEditingController? controller}) {
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

  Widget _buildDropdown() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.darkBg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(border: InputBorder.none),
        dropdownColor: AppColors.darkBg,
        value: _selectedUserType,
        items: const [
          DropdownMenuItem(value: "paciente", child: Text("Paciente", style: TextStyle(color: Colors.white))),
          DropdownMenuItem(value: "doctor", child: Text("Doctor", style: TextStyle(color: Colors.white))),
        ],
        onChanged: (v) => setState(() => _selectedUserType = v),
        hint: Text("Tipo de Usuario", style: TextStyle(color: AppColors.lightBg)),
      ),
    );
  }

  Widget _buildLoginLink(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("¿Ya tienes una cuenta?", style: TextStyle(color: AppColors.lightBg)),
      TextButton(
        onPressed: () => Navigator.pushNamed(context, '/login'),
        child: Text("Inicia sesión", style: TextStyle(color: AppColors.lightBg)),
      ),
    ],
  );
}