// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_doctor_ui_appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDoctorUIAppointment _$GetDoctorUIAppointmentFromJson(
        Map<String, dynamic> json) =>
    GetDoctorUIAppointment(
      doctorId: json['doctorId'] as String?,
      department: json['department'] as String?,
      date: json['date'] as String?,
      email: json['email'] as String?,
      fullname: json['fullname'] as String?,
      id: json['_id'] as String?,
      mobile: json['mobile'] as String?,
      patientId: json['patientId'] == null
          ? null
          : PatientModel.fromJson(json['patientId'] as Map<String, dynamic>),
      time: json['time'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$GetDoctorUIAppointmentToJson(
        GetDoctorUIAppointment instance) =>
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
