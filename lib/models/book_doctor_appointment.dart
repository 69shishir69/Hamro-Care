import 'package:json_annotation/json_annotation.dart';
part 'book_doctor_appointment.g.dart';

@JsonSerializable()
class BookDoctorAppointment {
  String? department;
  String? date;
  String? time;
  String? fullname;
  String? mobile;
  String? email;
  String? doctorId;

  BookDoctorAppointment({
    this.department,
    this.date,
    this.time,
    this.email,
    this.fullname,
    this.mobile,
    this.doctorId,
  });

  factory BookDoctorAppointment.fromJson(Map<String, dynamic> json) =>
      _$BookDoctorAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$BookDoctorAppointmentToJson(this);
}
