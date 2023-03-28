import 'package:hospital_management_system/response/appointment_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'book_appointment_response.g.dart';

@JsonSerializable()
class BookAppointmentResponse {
  bool? success;
  List<AppointmentResponse>? data;

  BookAppointmentResponse({
    this.data,
    this.success,
  });

  factory BookAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$BookAppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookAppointmentResponseToJson(this);
}
