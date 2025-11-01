import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../widgets/patient_drawer.dart';

class PatientChatView extends StatelessWidget {
  const PatientChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final mensajes = [
      {"de": "doctor", "texto": "Hola, ¿cómo te sientes hoy?"},
      {"de": "paciente", "texto": "Buenos días doctor, sigo con tos seca."},
      {"de": "doctor", "texto": "¿Ha tenido fiebre o dificultad al respirar?"},
      {"de": "paciente", "texto": "No, solo la tos y un poco de cansancio."},
      {"de": "doctor", "texto": "Perfecto, siga con la medicación y evite esfuerzos."},
    ];

    final TextEditingController msgController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.lightBg,
      appBar: AppBar(
        backgroundColor: AppColors.darkBg,
        title: const Text("Chat Paciente - Doctor"),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: const PatientDrawer(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: AppColors.lightBg,
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: mensajes.length,
                itemBuilder: (context, index) {
                  final msg = mensajes[index];
                  final esPaciente = msg["de"] == "paciente";

                  return Align(
                    alignment: esPaciente
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.all(12),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.75,
                      ),
                      decoration: BoxDecoration(
                        color: esPaciente
                            ? AppColors.darkBg
                            : Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(14),
                          topRight: const Radius.circular(14),
                          bottomLeft: Radius.circular(esPaciente ? 14 : 0),
                          bottomRight: Radius.circular(esPaciente ? 0 : 14),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.05),
                            blurRadius: 3,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        msg["texto"]!,
                        style: TextStyle(
                          color: esPaciente ? Colors.white : Colors.black87,
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
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: msgController,
                      decoration: InputDecoration(
                        hintText: "Escribe un mensaje...",
                        hintStyle: const TextStyle(color: Colors.black54),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: const BorderSide(color: Colors.black12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: const BorderSide(color: Colors.black12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide:
                          BorderSide(color: AppColors.darkBg, width: 1.2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.darkBg,
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: () {
                        msgController.clear();
                      },
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
