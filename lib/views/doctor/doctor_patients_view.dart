import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../widgets/doctor_drawer.dart';

class DoctorPatientsView extends StatefulWidget {
  const DoctorPatientsView({super.key});

  @override
  State<DoctorPatientsView> createState() => _DoctorPatientsViewState();
}

class _DoctorPatientsViewState extends State<DoctorPatientsView> {
  List<Map<String, dynamic>> pacientes = [
    {
      "nombre": "Eduar Siquita",
      "correo": "eduarsi@gmail.com",
      "telefono": "987654321",
      "ultimaVisita": "15 Oct 2025",
      "diagnostico": "Sin indicios de cáncer",
      "riesgo": "Bajo",
    },
    {
      "nombre": "Lucía Torres",
      "correo": "lucia.t@gmail.com",
      "telefono": "912345678",
      "ultimaVisita": "10 Oct 2025",
      "diagnostico": "Sombra pulmonar detectada",
      "riesgo": "Medio",
    },
    {
      "nombre": "Carlos López",
      "correo": "carlosl@gmail.com",
      "telefono": "923456789",
      "ultimaVisita": "7 Oct 2025",
      "diagnostico": "Lesión sospechosa",
      "riesgo": "Alto",
    },
  ];

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final filteredPacientes = pacientes.where((p) {
      final query = _searchController.text.toLowerCase();
      return p["nombre"].toString().toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.lightBg,
      appBar: AppBar(
        backgroundColor: AppColors.darkBg,
        foregroundColor: AppColors.lightBg,
        title: const Text("Pacientes"),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            color: Colors.white,
            tooltip: "Agregar paciente",
            onPressed: () => _showAddPatientDialog(context),
          ),
        ],
      ),
      drawer: const DoctorDrawer(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: AppColors.lightBg,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Lista de pacientes asignados",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Buscar paciente...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.darkBg, width: 1.2),
                  ),
                ),
                onChanged: (_) => setState(() {}),
              ),

              const SizedBox(height: 22),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredPacientes.length,
                itemBuilder: (context, index) {
                  final p = filteredPacientes[index];
                  return _buildPatientCard(
                    nombre: p["nombre"].toString(),
                    correo: p["correo"].toString(),
                    telefono: p["telefono"].toString(),
                    ultimaVisita: p["ultimaVisita"].toString(),
                    diagnostico: p["diagnostico"].toString(),
                    riesgo: p["riesgo"].toString(),
                    context: context,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPatientCard({
    required String nombre,
    required String correo,
    required String telefono,
    required String ultimaVisita,
    required String diagnostico,
    required String riesgo,
    required BuildContext context,
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
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: riesgoColor.withOpacity(0.15),
            child: Icon(
              Icons.person,
              color: riesgoColor,
              size: 28,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nombre, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text("Correo: $correo", style: const TextStyle(color: Colors.black54, fontSize: 14)),
                Text("Teléfono: $telefono", style: const TextStyle(color: Colors.black54, fontSize: 14)),
                Text("Última visita: $ultimaVisita", style: const TextStyle(color: Colors.black54, fontSize: 14)),
                const SizedBox(height: 6),
                Text(diagnostico, style: TextStyle(color: riesgoColor, fontWeight: FontWeight.w600, fontSize: 14)),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                icon: const Icon(Icons.chat_bubble_outline),
                color: AppColors.darkBg,
                onPressed: () {
                  Navigator.pushNamed(context, '/doctor/chat');
                },
                tooltip: "Chatear con paciente",
              ),
              IconButton(
                icon: const Icon(Icons.visibility_outlined),
                color: AppColors.darkBg,
                onPressed: () {
                  Navigator.pushNamed(context, '/doctor/history');
                },
                tooltip: "Ver historial médico",
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showAddPatientDialog(BuildContext context) {
    final _nombreController = TextEditingController();
    final _correoController = TextEditingController();
    final _telefonoController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Agregar nuevo paciente"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nombreController,
                decoration: const InputDecoration(labelText: "Nombre completo"),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _correoController,
                decoration: const InputDecoration(labelText: "Correo"),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _telefonoController,
                decoration: const InputDecoration(labelText: "Teléfono"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                final nombre = _nombreController.text.trim();
                final correo = _correoController.text.trim();
                final telefono = _telefonoController.text.trim();

                if (nombre.isNotEmpty && correo.isNotEmpty && telefono.isNotEmpty) {
                  setState(() {
                    pacientes.add({
                      "nombre": nombre,
                      "correo": correo,
                      "telefono": telefono,
                      "ultimaVisita": "Pendiente",
                      "diagnostico": "Sin diagnóstico",
                      "riesgo": "Bajo",
                    });
                  });

                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Paciente '$nombre' agregado")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Completa todos los campos correctamente")),
                  );
                }
              },
              child: const Text("Agregar"),
            ),
          ],
        );
      },
    );
  }
}
