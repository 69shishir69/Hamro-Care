// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookAppointment _$BookAppointmentFromJson(Map<String, dynamic> json) =>
    BookAppointment(
      category: json['category'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      appointmentFor: json['appointmentFor'] as String?,
      visitPurpose: json['visitPurpose'] as String?,
      email: json['email'] as String?,
      fullname: json['fullname'] as String?,
      mobile: json['mobile'] as String?,
      patientId: json['patientId'] as String?,
    );

Map<String, dynamic> _$BookAppointmentToJson(BookAppointment instance) =>
    <String, dynamic>{
      'category': instance.category,
      'date': instance.date,
      'time': instance.time,
      'visitPurpose': instance.visitPurpose,
      'appointmentFor': instance.appointmentFor,
      'fullname': instance.fullname,
      'mobile': instance.mobile,
      'email': instance.email,
      'patientId': instance.patientId,
    };
