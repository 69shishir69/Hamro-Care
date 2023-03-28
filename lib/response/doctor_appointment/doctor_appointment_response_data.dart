import 'package:hospital_management_system/response/doctor_appointment/get_doctor_appointment_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'doctor_appointment_response_data.g.dart';

@JsonSerializable()
class DoctorAppointmentResponseData {
  bool? success;
  List<GetDoctorAppointmentResponse>? data;

  DoctorAppointmentResponseData({
    this.data,
    this.success,
  });

  factory DoctorAppointmentResponseData.fromJson(Map<String, dynamic> json) =>
      _$DoctorAppointmentResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorAppointmentResponseDataToJson(this);
}
