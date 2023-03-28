import 'package:hospital_management_system/models/doctorModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'doctor_appointment_response.g.dart';

@JsonSerializable()
class DoctorAppointmentResponse {
  List<DoctorModel>? details;

  DoctorAppointmentResponse({this.details});

  factory DoctorAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorAppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorAppointmentResponseToJson(this);
}
