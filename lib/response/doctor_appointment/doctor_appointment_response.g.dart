// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorAppointmentResponse _$DoctorAppointmentResponseFromJson(
        Map<String, dynamic> json) =>
    DoctorAppointmentResponse(
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoctorAppointmentResponseToJson(
        DoctorAppointmentResponse instance) =>
    <String, dynamic>{
      'details': instance.details,
    };
