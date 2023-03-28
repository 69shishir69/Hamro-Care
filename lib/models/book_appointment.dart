import 'package:json_annotation/json_annotation.dart';
part 'book_appointment.g.dart';

@JsonSerializable()
class BookAppointment {
  String? category;
  String? date;
  String? time;
  String? visitPurpose;
  String? appointmentFor;
  String? fullname;
  String? mobile;
  String? email;
  String? patientId;

  BookAppointment({
    this.category,
    this.date,
    this.time,
    this.appointmentFor,
    this.visitPurpose,
    this.email,
    this.fullname,
    this.mobile,
    this.patientId,
  });

  factory BookAppointment.fromJson(Map<String, dynamic> json) =>
      _$BookAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$BookAppointmentToJson(this);
}
