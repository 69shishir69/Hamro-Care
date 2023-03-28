import 'dart:io';

import 'package:hospital_management_system/api/user_api.dart';
import 'package:hospital_management_system/models/doctor_user.dart';
import 'package:hospital_management_system/models/patient_profile.dart';
import 'package:hospital_management_system/models/user.dart';

class UserRepository {
  Future<bool> registerUser(User user) async {
    return await UserApi().registerUser(user);
  }

  Future<bool> loginUser(String username, String password) async {
    return await UserApi().loginUser(username, password);
  }

  Future<User?> getUserDetails() async {
    return await UserApi().getUserDetails();
  }

  Future<bool> loginDoctor(String username, String password) async {
    return await UserApi().loginDoctor(username, password);
  }

  Future<bool> updatePatientProfile(
      PatientProfile patientProfile, File? image) async {
    return await UserApi().updatePatientProfile(patientProfile, image);
  }

  Future<DoctorUser?> getDoctorProfile() async {
    return await UserApi().getDoctorProfile();
  }
}
