// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_doctor_appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDoctorAppointmentResponse _$GetDoctorAppointmentResponseFromJson(
        Map<String, dynamic> json) =>
    GetDoctorAppointmentResponse(
      doctorId: json['doctorId'] == null
          ? null
          : DoctorModel.fromJson(json['doctorId'] as Map<String, dynamic>),
      department: json['department'] as String?,
      date: json['date'] as String?,
      email: json['email'] as String?,
      fullname: json['fullname'] as String?,
      id: json['_id'] as String?,
      mobile: json['mobile'] as String?,
      patientId: json['patientId'] as String?,
      time: json['time'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$GetDoctorAppointmentResponseToJson(
        GetDoctorAppointmentResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'department': instance.department,
      'date': instance.date,
      'time': instance.time,
      'doctorId': instance.doctorId,
      'status': instance.status,
      'fullname': instance.fullname,
      'mobile': instance.mobile,
      'email': instance.email,
      'patientId': instance.patientId,
    };
