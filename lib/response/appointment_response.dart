import 'package:json_annotation/json_annotation.dart';
part "appointment_response.g.dart";

@JsonSerializable()
class AppointmentResponse {
  @JsonKey(name: "_id")
  String? id;
  String? category;
  String? date;
  String? time;
  String? visitPurpose;
  String? appointmentFor;
  String? fullname;
  String? mobile;
  String? email;
  String? patientId;

  AppointmentResponse({
    this.appointmentFor,
    this.category,
    this.date,
    this.email,
    this.fullname,
    this.id,
    this.mobile,
    this.patientId,
    this.time,
    this.visitPurpose,
  });

  factory AppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentResponseToJson(this);
}
