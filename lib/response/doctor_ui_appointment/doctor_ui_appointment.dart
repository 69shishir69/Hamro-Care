import 'package:hospital_management_system/response/doctor_ui_appointment/get_doctor_ui_appointment.dart';
import 'package:json_annotation/json_annotation.dart';
part 'doctor_ui_appointment.g.dart';

@JsonSerializable()
class DoctorUIAppointment {
  bool? success;
  List<GetDoctorUIAppointment>? data;

  DoctorUIAppointment({
    this.data,
    this.success,
  });

  factory DoctorUIAppointment.fromJson(Map<String, dynamic> json) =>
      _$DoctorUIAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorUIAppointmentToJson(this);
}
