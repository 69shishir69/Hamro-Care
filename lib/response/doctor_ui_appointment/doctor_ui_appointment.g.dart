// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_ui_appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorUIAppointment _$DoctorUIAppointmentFromJson(Map<String, dynamic> json) =>
    DoctorUIAppointment(
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => GetDoctorUIAppointment.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$DoctorUIAppointmentToJson(
        DoctorUIAppointment instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
