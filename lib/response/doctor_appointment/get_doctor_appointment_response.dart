import 'package:hospital_management_system/models/doctorModel.dart';
import 'package:json_annotation/json_annotation.dart';
part "get_doctor_appointment_response.g.dart";

@JsonSerializable()
class GetDoctorAppointmentResponse {
  @JsonKey(name: "_id")
  String? id;
  String? department;
  String? date;
  String? time;
  DoctorModel? doctorId;
  String? status;
  String? fullname;
  String? mobile;
  String? email;
  String? patientId;

  GetDoctorAppointmentResponse({
    this.doctorId,
    this.department,
    this.date,
    this.email,
    this.fullname,
    this.id,
    this.mobile,
    this.patientId,
    this.time,
    this.status,
  });

  factory GetDoctorAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDoctorAppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDoctorAppointmentResponseToJson(this);
}
