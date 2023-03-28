import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management_system/api/http_services.dart';
import 'package:hospital_management_system/models/appointment_hdt_model.dart';
import 'package:hospital_management_system/models/book_appointment.dart';
import 'package:hospital_management_system/models/book_doctor_appointment.dart';
import 'package:hospital_management_system/models/doctorModel.dart';
import 'package:hospital_management_system/models/health_category.dart';
import 'package:hospital_management_system/response/appointment_hdt_response.dart';
import 'package:hospital_management_system/response/appointment_response.dart';
import 'package:hospital_management_system/response/book_appointment_response.dart';
import 'package:hospital_management_system/response/doctor_appointment/doctor_appointment_response.dart';
import 'package:hospital_management_system/response/doctor_appointment/doctor_appointment_response_data.dart';
import 'package:hospital_management_system/response/doctor_appointment/get_doctor_appointment_response.dart';
import 'package:hospital_management_system/response/doctor_ui_appointment/doctor_ui_appointment.dart';
import 'package:hospital_management_system/response/doctor_ui_appointment/get_doctor_ui_appointment.dart';
import 'package:hospital_management_system/response/health_category_id.dart';
import 'package:hospital_management_system/response/health_category_response.dart';
import 'package:hospital_management_system/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryAPI {
  Future<List<HealthCategory?>> loadHealthCategory() async {
    List<HealthCategory?> healthCateogryList = [];
    Response response;
    var url = baseUrl + getHealthCategoryUrl;

    var dio = HttpServices().getDioInstance();
    dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);
    try {
      response = await dio.get(
        url,
        options: buildCacheOptions(const Duration(days: 7)),
      );
      debugPrint(response.toString());

      if (response.statusCode == 201) {
        HealthCategoryResponse healthCategoryResponse =
            HealthCategoryResponse.fromJson(response.data);

        for (var data in healthCategoryResponse.data!) {
          healthCateogryList.add(
            HealthCategory(
              id: data.id,
              name: data.name,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to get category $e');
    }

    return healthCateogryList;
  }

  Future<List<AppointmentHDTModel?>> loadAppointmentHDT(
      String healthCategoryID) async {
    List<AppointmentHDTModel?> appointmentHDTList = [];
    Response response;
    var url = baseUrl + getAppointmentHDT;

    var dio = HttpServices().getDioInstance();

    try {
      response = await dio.get(url + healthCategoryID);

      if (response.statusCode == 201) {
        AppointmentHDTResponse appointmentHDTResponse =
            AppointmentHDTResponse.fromJson(response.data);

        for (var data in appointmentHDTResponse.data!) {
          appointmentHDTList.add(
            AppointmentHDTModel(
              id: data.id,
              healthCategoryID: data.healthCategoryID,
              date: data.date,
              time: data.time,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to get category $e');
    }

    return appointmentHDTList;
  }

  Future<bool> bookAppointment(BookAppointment appointment) async {
    bool? isBooked = false;
    Response response;
    String url = baseUrl + bookAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("patient");
      response = await dio.post(
        url,
        data: appointment.toJson(),
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isBooked;
  }

  Future<List<AppointmentResponse?>> getBookedAppointment() async {
    List<AppointmentResponse?> appointmentResponseList = [];
    Response response;
    String? url = baseUrl + getBookedAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("patient");
      debugPrint("Token: " + token!);
      response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      debugPrint("Category API Response :" + response.data.toString());
      if (response.statusCode == 201) {
        BookAppointmentResponse bookAppointmentResponse =
            BookAppointmentResponse.fromJson(response.data);
        for (var data in bookAppointmentResponse.data!) {
          appointmentResponseList.add(AppointmentResponse(
            appointmentFor: data.appointmentFor,
            category: data.category,
            date: data.date,
            email: data.email,
            fullname: data.fullname,
            id: data.id,
            mobile: data.mobile,
            patientId: data.patientId,
            time: data.time,
            visitPurpose: data.visitPurpose,
          ));
        }
      }
    } catch (e) {
      debugPrint("Failed to get data:: ${e.toString()}");
    }
    return appointmentResponseList;
  }

  Future<bool> deleteTime(
      String healthCategoryID, String date, String time) async {
    bool isDeleted = false;
    Response response;
    String url = baseUrl + deleteAppointmentTimeUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      response = await dio.put(
        url,
        data: {
          "healthCategoryID": healthCategoryID,
          "date": date,
          "time": time,
        },
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isDeleted;
  }

  Future<bool> reAddAppointmentTime(
      String healthCategoryID, String date, String time) async {
    bool? isAdded = false;
    String url = baseUrl + reAddAppointmentTimeUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      Response response = await dio.put(
        url + healthCategoryID,
        data: {
          "date": date,
          "time": time,
        },
      );
      // debugPrint("Response: " + response.data.toString());
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isAdded;
  }

  Future<bool> updateAppointment(
      AppointmentResponse appointmentResponse) async {
    bool isUpdated = false;
    Response response;
    String url = baseUrl + updateAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();
    debugPrint(appointmentResponse.id);
    debugPrint(appointmentResponse.fullname);
    debugPrint(appointmentResponse.mobile);
    debugPrint(appointmentResponse.email);
    debugPrint(appointmentResponse.appointmentFor);

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      response = await dio.put(
        url + appointmentResponse.id!,
        data: {
          "fullname": appointmentResponse.fullname,
          "mobile": appointmentResponse.mobile,
          "email": appointmentResponse.email,
          "appointmentFor": appointmentResponse.appointmentFor,
        },
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      // debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isUpdated;
  }

  Future<HealthCategory?> getHealthCategoryId(String name) async {
    String url = baseUrl + getHealthCateogryIdUrl;
    Dio dio = HttpServices().getDioInstance();
    HealthCategory? healthCategory;
    try {
      Response response = await dio.get(url + name);
      // debugPrint("datadddddddddddddddddddddd" + response.data.toString());

      if (response.statusCode == 200) {
        HealthCategoryId healthCategoryId =
            HealthCategoryId.fromJson(response.data);

        healthCategory = HealthCategory.fromJson(healthCategoryId.data);
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return healthCategory;
  }

  Future<bool> deleteAppointment(String appointmentId) async {
    bool isDeleted = false;
    String url = baseUrl + deleteAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("patient");
      Response response = await dio.delete(
        url + appointmentId,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      // debugPrint(response.toString());
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isDeleted;
  }

  // -----------------------------Doctor Part Started---------------------------------------------------------------------------
  Future<List<DoctorModel?>> loadDepartmentDoctor(String department) async {
    List<DoctorModel?> doctorAppointmentList = [];
    Response response;
    var url = baseUrl + getDepartmentDoctor;

    var dio = HttpServices().getDioInstance();
    // debugPrint(department);
    try {
      response = await dio.get(url + department);
      // debugPrint(response.data.toString());

      if (response.statusCode == 200) {
        DoctorAppointmentResponse doctorAppointmentResponse =
            DoctorAppointmentResponse.fromJson(response.data);
        // debugPrint(doctorAppointmentResponse.details![0].toString());

        for (var data in doctorAppointmentResponse.details!) {
          doctorAppointmentList.add(
            DoctorModel(
              id: data.id,
              fname: data.fname,
              lname: data.lname,
              gender: data.gender,
              age: data.age,
              username: data.username,
              email: data.email,
              phone: data.phone,
              address: data.address,
              password: data.password,
              department: data.department,
              picture: data.picture,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to get Department:::: $e');
    }
    // debugPrint(doctorAppointmentList.toString());
    return doctorAppointmentList;
  }

  Future<bool> bookDoctorAppointment(BookDoctorAppointment appointment) async {
    bool? isBooked = false;
    Response response;
    String url = baseUrl + bookDoctorAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("patient");
      response = await dio.post(
        url,
        data: appointment.toJson(),
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isBooked;
  }

  Future<List<GetDoctorAppointmentResponse?>>
      getBookedDoctorAppointment() async {
    List<GetDoctorAppointmentResponse?> appointmentResponseList = [];
    Response response;
    String? url = baseUrl + getBookedDoctorAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("patient");
      debugPrint("Token: " + token!);
      response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      debugPrint("Category API Response :" + response.data.toString());
      if (response.statusCode == 200) {
        DoctorAppointmentResponseData bookAppointmentResponse =
            DoctorAppointmentResponseData.fromJson(response.data);
        for (var data in bookAppointmentResponse.data!) {
          appointmentResponseList.add(GetDoctorAppointmentResponse(
            id: data.id,
            patientId: data.patientId,
            doctorId: data.doctorId,
            date: data.date,
            email: data.email,
            fullname: data.fullname,
            mobile: data.mobile,
            time: data.time,
            status: data.status,
            department: data.department,
          ));
        }
      }
    } catch (e) {
      debugPrint("Failed to get data:: ${e.toString()}");
    }
    return appointmentResponseList;
  }

  Future<bool> deleteDoctorAppointment(String appointmentId) async {
    bool isDeleted = false;
    String url = baseUrl + deleteBookedDoctorAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("patient");
      Response response = await dio.delete(
        url + appointmentId,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      // debugPrint(response.toString());
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isDeleted;
  }

  Future<bool> updateDoctorAppointment(
      GetDoctorAppointmentResponse appointment) async {
    bool? isBooked = false;
    Response response;
    String url = baseUrl + updateDoctorAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("patient");
      response = await dio.put(
        url + appointment.id!,
        data: {
          "fullname": appointment.fullname,
          "mobile": appointment.mobile,
          "email": appointment.email,
          "date": appointment.date,
          "time": appointment.time,
        },
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isBooked;
  }

  // -------------------------------- Doctor UI part API ----------------------------------------------------------------------

  Future<List<GetDoctorUIAppointment?>> getDoctorUIAppointment(
      String status) async {
    List<GetDoctorUIAppointment?> appointmentResponseList = [];
    Response response;
    String? url = baseUrl + doctorAppointmentStatusUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("doctor");
      debugPrint("Token: " + token!);
      response = await dio.get(
        url + status,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      // debugPrint("Category API UI Response :" + response.data.toString());
      if (response.statusCode == 200) {
        DoctorUIAppointment bookAppointmentResponse =
            DoctorUIAppointment.fromJson(response.data);
        for (var data in bookAppointmentResponse.data!) {
          appointmentResponseList.add(GetDoctorUIAppointment(
            id: data.id,
            patientId: data.patientId,
            doctorId: data.doctorId,
            date: data.date,
            email: data.email,
            fullname: data.fullname,
            mobile: data.mobile,
            time: data.time,
            status: data.status,
            department: data.department,
          ));
        }
      }
    } catch (e) {
      debugPrint("Failed to get data:: ${e.toString()}");
    }
    return appointmentResponseList;
  }

  Future<bool> updateDoctorUIAppointment(String id, String status) async {
    bool isUpdated = false;
    Response response;
    String? url = baseUrl + doctorAppointmentUpdateStatusUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("doctor");
      debugPrint("Token: " + token!);
      var data = {"appointmentStatus": status};
      response = await dio.put(
        url + id,
        data: data,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error in Updating appointment");
    }
    return isUpdated;
  }
}
