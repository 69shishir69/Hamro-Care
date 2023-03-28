import 'package:hospital_management_system/models/appointment_hdt_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'appointment_hdt_response.g.dart';

@JsonSerializable()
class AppointmentHDTResponse {
  bool? success;
  List<AppointmentHDTModel>? data;

  AppointmentHDTResponse({this.success, this.data});

  factory AppointmentHDTResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentHDTResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentHDTResponseToJson(this);
}
