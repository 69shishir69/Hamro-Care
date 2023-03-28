// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentResponse _$AppointmentResponseFromJson(Map<String, dynamic> json) =>
    AppointmentResponse(
      appointmentFor: json['appointmentFor'] as String?,
      category: json['category'] as String?,
      date: json['date'] as String?,
      email: json['email'] as String?,
      fullname: json['fullname'] as String?,
      id: json['_id'] as String?,
      mobile: json['mobile'] as String?,
      patientId: json['patientId'] as String?,
      time: json['time'] as String?,
      visitPurpose: json['visitPurpose'] as String?,
    );

Map<String, dynamic> _$AppointmentResponseToJson(
        AppointmentResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
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
