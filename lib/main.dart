import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/book_appointment/date_screen.dart';
import 'package:hospital_management_system/screens/book_appointment/details_screen.dart';
import 'package:hospital_management_system/screens/book_appointment/health_concern_screen.dart';
import 'package:hospital_management_system/screens/book_doctor_appointment/appointment_details_screen.dart';
import 'package:hospital_management_system/screens/book_doctor_appointment/search_select_doctor.dart';
import 'package:hospital_management_system/screens/book_doctor_appointment/select_department.dart';
import 'package:hospital_management_system/screens/bottom_nav_bar.dart';
import 'package:hospital_management_system/screens/home_screen.dart';
import 'package:hospital_management_system/screens/login_page.dart';
import 'package:hospital_management_system/screens/patient_profile_update.dart';
import 'package:hospital_management_system/screens/register_page.dart';
import 'package:hospital_management_system/screens/splash_screen.dart';
import 'package:hospital_management_system/screens/update_appointment.dart';
import 'package:hospital_management_system/screens/update_doctor_appointment.dart';
import 'package:hospital_management_system/screens/wear_os_screens/wear_apt.dart';
import 'package:hospital_management_system/screens/wear_os_screens/wear_doc_apt.dart';
import 'package:hospital_management_system/screens/wear_os_screens/wear_login.dart';

void main() {
  AwesomeNotifications().initialize(
    "",
    [
      NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic Notification',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: Colors.transparent,
        importance: NotificationImportance.High,
        channelShowBadge: true,
      ),
    ],
  );
  runApp(
    MaterialApp(
      // theme: ThemeData(fontFamily: "Roboto"),
      debugShowCheckedModeBanner: false,
      initialRoute: '/wearLogin',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/bottomNavBar': (context) => const BottomNavBar(),
        '/login': (context) => const LoginPageScreen(),
        '/registerPage': (context) => const RegisterPageScreen(),
        '/homeScreen': (context) => const HomeScreen(),
        '/healthCategoryScreen': (context) => const HealthCategoryScreen(),
        '/dateScreen': (context) => const AppointmentDateScreen(),
        '/appointmentDetailScreen': (context) =>
            const AppointmentDetailsScreen(),
        "/updateAppointmentScreen": (context) =>
            const UpdateAppointmentScreen(),
        '/doctorDepartmentScreen': (context) => const DoctorDepartmentScreen(),
        '/searchDoctor': (context) => const SearchDoctor(),
        '/appointmentDoctorDetailsScreen': (context) =>
            const AppointmentDoctorDetailsScreen(),
        '/updateAppointmentDoctor': (context) =>
            const UpdateAppointmentDoctor(),
        '/patientProfileUpdate': (context) => const PatientProfileUpdate(),

        // Wear OS
        '/wearLogin': (context) => const WearOsLogin(),
        "/wearApt": (context) => const WearAppointment(),
        '/wearDocApt': (context) => const WearDoctorAppointment(),
      },
    ),
  );
}
