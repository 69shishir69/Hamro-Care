import 'package:hospital_management_system/api/category_api.dart';
import 'package:hospital_management_system/models/appointment_hdt_model.dart';
import 'package:hospital_management_system/models/book_appointment.dart';
import 'package:hospital_management_system/models/book_doctor_appointment.dart';
import 'package:hospital_management_system/models/doctorModel.dart';
import 'package:hospital_management_system/models/health_category.dart';
import 'package:hospital_management_system/response/appointment_response.dart';
import 'package:hospital_management_system/response/doctor_appointment/get_doctor_appointment_response.dart';
import 'package:hospital_management_system/response/doctor_ui_appointment/get_doctor_ui_appointment.dart';

class CategoryRepository {
  Future<List<HealthCategory?>> loadHealthCategory() {
    return CategoryAPI().loadHealthCategory();
  }

  Future<List<AppointmentHDTModel?>> loadAppointmentHDT(
      String healthCategoryID) {
    return CategoryAPI().loadAppointmentHDT(healthCategoryID);
  }

  Future<bool> bookAppointment(BookAppointment appointment) async {
    return await CategoryAPI().bookAppointment(appointment);
  }

  Future<List<AppointmentResponse?>> getBookedAppointment() async {
    return await CategoryAPI().getBookedAppointment();
  }

  Future<bool> deleteTime(
      String healthCategoryID, String date, String time) async {
    return await CategoryAPI().deleteTime(healthCategoryID, date, time);
  }

  Future<bool> reAddAppointmentTime(
      String healthCategoryID, String date, String time) async {
    return await CategoryAPI()
        .reAddAppointmentTime(healthCategoryID, date, time);
  }

  Future<bool> updateAppointment(
      AppointmentResponse appointmentResponse) async {
    return await CategoryAPI().updateAppointment(appointmentResponse);
  }

  Future<bool> deleteAppointment(String appointmentId) async {
    return await CategoryAPI().deleteAppointment(appointmentId);
  }

  Future<HealthCategory?> getHealthCategoryId(String name) async {
    return await CategoryAPI().getHealthCategoryId(name);
  }

  Future<List<DoctorModel?>> loadDepartmentDoctor(String department) {
    return CategoryAPI().loadDepartmentDoctor(department);
  }

  Future<bool> bookDoctorAppointment(BookDoctorAppointment appointment) async {
    return await CategoryAPI().bookDoctorAppointment(appointment);
  }

  Future<List<GetDoctorAppointmentResponse?>>
      getBookedDoctorAppointment() async {
    return await CategoryAPI().getBookedDoctorAppointment();
  }

  Future<bool> deleteDoctorAppointment(String appointmentId) async {
    return await CategoryAPI().deleteDoctorAppointment(appointmentId);
  }

  Future<bool> updateDoctorAppointment(
      GetDoctorAppointmentResponse appointment) async {
    return await CategoryAPI().updateDoctorAppointment(appointment);
  }

  Future<List<GetDoctorUIAppointment?>> getDoctorUIAppointment(
      String status) async {
    return await CategoryAPI().getDoctorUIAppointment(status);
  }

  Future<bool> updateDoctorUIAppointment(String id, String status) async {
    return await CategoryAPI().updateDoctorUIAppointment(id, status);
  }
}
