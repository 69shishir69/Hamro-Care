import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management_system/api/http_services.dart';
import 'package:hospital_management_system/models/doctor_user.dart';
import 'package:hospital_management_system/models/patient_profile.dart';
import 'package:hospital_management_system/models/user.dart';
import 'package:hospital_management_system/response/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/url.dart';

class UserApi {
  Future<bool> registerUser(User user) async {
    bool isSignUp = false;
    Response response;
    var url = baseUrl + registerUrl;
    var dio = HttpServices().getDioInstance();
    try {
      response = await dio.post(
        url,
        data: user.toJson(),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isSignUp;
  }

  Future<bool> loginUser(String email, String password) async {
    bool isLogin = false;

    try {
      var url = baseUrl + loginUrl;
      var dio = HttpServices().getDioInstance();
      var response = await dio.post(
        url,
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        debugPrint(response.toString());
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        token = loginResponse.token;
        // print(token);
        if (token != null) {
          // debugPrint(token);
          // SharedPreferences.setMockInitialValues({});
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("patient", token!);
          // String? try1 = prefs.getString("patient");
          // debugPrint(try1);

          // print("ok1233");
          isLogin = true;
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }

  Future<User?> getUserDetails() async {
    User? user;
    try {
      var url = baseUrl + getUserDetailsUrl;
      var dio = HttpServices().getDioInstance();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("patient");
      var response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      debugPrint(response.data.toString());
      if (response.statusCode == 201) {
        user = User.fromJson(response.data);
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return user;
  }

  Future<DoctorUser?> getDoctorProfile() async {
    debugPrint("take 1 ..................................");

    DoctorUser? user;
    try {
      var url = baseUrl + doctorGetProfile;
      var dio = HttpServices().getDioInstance();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("doctor");
      var response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );

      debugPrint("_________Doctor Profile Response___________" +
          response.data.toString());
      if (response.statusCode == 200) {
        user = DoctorUser.fromJson(response.data);
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return user;
  }

  Future<bool> updatePatientProfile(
      PatientProfile patientProfile, File? image) async {
    // String fileName = image!.path.split('/').last;
    // debugPrint("FileName: " + fileName);
    // debugPrint("Image Path: " + image.path.toString());
    bool isUpdated = false;
    FormData data = FormData.fromMap({
      "fname": patientProfile.fname,
      "lname": patientProfile.lname,
      "gender": patientProfile.gender,
      "age": patientProfile.age,
      "username": patientProfile.username,
      "phone": patientProfile.phone,
      "address": patientProfile.address,
      // "pat_img": await MultipartFile.fromFile(
      //   image.path,
      //   filename: fileName,
      // ),
    });
    try {
      var url = baseUrl + updatePatientProfileUrl;
      var dio = HttpServices().getDioInstance();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("patient");
      var response = await dio.put(
        url,
        data: data,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error updating patient profile: " + e.toString());
    }

    return isUpdated;
  }

  Future<bool> loginDoctor(String email, String password) async {
    bool isLogin = false;

    try {
      var url = baseUrl + doctorLoginUrl;
      var dio = HttpServices().getDioInstance();
      var response = await dio.post(
        url,
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        debugPrint(response.toString());
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        token = loginResponse.token;
        // print(token);
        if (token != null) {
          // debugPrint(token);
          // SharedPreferences.setMockInitialValues({});
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("doctor", token!);
          // String? try1 = prefs.getString("patient");
          // debugPrint(try1);

          // print("ok1233");
          isLogin = true;
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }
}
