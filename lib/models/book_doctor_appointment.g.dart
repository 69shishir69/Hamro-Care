// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_doctor_appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookDoctorAppointment _$BookDoctorAppointmentFromJson(
        Map<String, dynamic> json) =>
    BookDoctorAppointment(
      department: json['department'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      email: json['email'] as String?,
      fullname: json['fullname'] as String?,
      mobile: json['mobile'] as String?,
      doctorId: json['doctorId'] as String?,
    );

Map<String, dynamic> _$BookDoctorAppointmentToJson(
        BookDoctorAppointment instance) =>
    <String, dynamic>{
      'department': instance.department,
      'date': instance.date,
      'time': instance.time,
      'fullname': instance.fullname,
      'mobile': instance.mobile,
      'email': instance.email,
      'doctorId': instance.doctorId,
    };
