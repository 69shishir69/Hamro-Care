import 'package:hospital_management_system/models/patientModel.dart';
import 'package:json_annotation/json_annotation.dart';
part "get_doctor_ui_appointment.g.dart";

@JsonSerializable()
class GetDoctorUIAppointment {
  @JsonKey(name: "_id")
  String? id;
  String? department;
  String? date;
  String? time;
  String? doctorId;
  String? status;
  String? fullname;
  String? mobile;
  String? email;
  PatientModel? patientId;

  GetDoctorUIAppointment({
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

  factory GetDoctorUIAppointment.fromJson(Map<String, dynamic> json) =>
      _$GetDoctorUIAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$GetDoctorUIAppointmentToJson(this);
}
