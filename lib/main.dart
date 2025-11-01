import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/app_colors.dart';

// ViewModels
import 'viewmodels/patient_viewmodel.dart';
import 'viewmodels/doctor_viewmodel.dart';
import 'viewmodels/register_viewmodel.dart';
import 'viewmodels/login_viewmodel.dart';

// Vistas generales
import 'views/welcome_view.dart';
import 'views/login_view.dart';
import 'views/register_view.dart';

// Vistas paciente
import 'views/patient/patient_home_view.dart';
import 'views/patient/patient_upload_view.dart';
import 'views/patient/patient_history_view.dart';
import 'views/patient/patient_info_view.dart';
import 'views/patient/patient_chat_view.dart';
import 'views/patient/patient_settings_view.dart';
import 'views/patient/patient_guide_view.dart';

// Vistas doctor
import 'views/doctor/doctor_home_view.dart';
import 'views/doctor/doctor_patients_view.dart';
import 'views/doctor/doctor_upload_view.dart';
import 'views/doctor/doctor_chat_view.dart';
import 'views/doctor/doctor_settings_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PatientViewModel()),
        ChangeNotifierProvider(create: (_) => DoctorViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asistente Pulmonar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.darkBg,
        primaryColor: AppColors.darkBg,
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      initialRoute: '/',
      routes: {
        // Vistas generales
        '/': (context) => const WelcomeView(),
        '/login': (context) => const LoginView(),
        '/register': (context) => const RegisterView(),

        // Paciente
        '/patient/home': (context) => const PatientHomeView(),
        '/patient/upload': (context) => const PatientUploadView(),
        '/patient/history': (context) => const PatientHistoryView(),
        '/patient/info': (context) => const PatientInfoView(),
        '/patient/chat': (context) => const PatientChatView(),
        '/patient/settings': (context) => const PatientSettingsView(),
        '/patient/guide': (context) => const PatientGuideView(),

        // Doctor
        '/doctor/home': (context) => const DoctorHomeView(),
        '/doctor/patients': (context) => const DoctorPatientsView(),
        '/doctor/upload': (context) => const DoctorUploadView(),
        '/doctor/chat': (context) => const DoctorChatView(),
        '/doctor/settings': (context) => const DoctorSettingsView(),
      },
    );
  }
}
