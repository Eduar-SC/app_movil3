import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../widgets/doctor_drawer.dart';

class DoctorChatView extends StatefulWidget {
  const DoctorChatView({super.key});

  @override
  State<DoctorChatView> createState() => _DoctorChatViewState();
}

class _DoctorChatViewState extends State<DoctorChatView> {
  final TextEditingController _controller = TextEditingController();

  final List<Map<String, dynamic>> mensajes = [
    {"emisor": "paciente", "texto": "Buenos días, doctor."},
    {"emisor": "doctor", "texto": "Buenos días, ¿cómo se encuentra hoy?"},
    {
      "emisor": "paciente",
      "texto": "Un poco mejor, ya casi no tengo dificultad al respirar."
    },
  ];

  void _enviarMensaje() {
    final texto = _controller.text.trim();
    if (texto.isEmpty) return;

    setState(() {
      mensajes.add({"emisor": "doctor", "texto": texto});
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBg,
      appBar: AppBar(
        backgroundColor: AppColors.darkBg,
        foregroundColor: AppColors.lightBg,
        title: const Text("Chat con Paciente"),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: const DoctorDrawer(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: AppColors.lightBg,
              padding: const EdgeInsets.all(12),
              child: ListView.builder(
                itemCount: mensajes.length,
                itemBuilder: (context, index) {
                  final msg = mensajes[index];
                  final esDoctor = msg["emisor"] == "doctor";
                  return Align(
                    alignment: esDoctor
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 14),
                      decoration: BoxDecoration(
                        color:
                        esDoctor ? AppColors.darkBg : AppColors.lightBg,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: esDoctor
                              ? Colors.transparent
                              : AppColors.darkBg.withOpacity(0.3),
                        ),
                      ),
                      child: Text(
                        msg["texto"],
                        style: TextStyle(
                          color: esDoctor ? Colors.white : Colors.black87,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          Container(
            color: AppColors.darkBg.withOpacity(0.9),
            padding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Escribe un mensaje...",
                        hintStyle: const TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor: AppColors.darkBg,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onSubmitted: (_) => _enviarMensaje(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: AppColors.lightBg,
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.black),
                      onPressed: _enviarMensaje,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
