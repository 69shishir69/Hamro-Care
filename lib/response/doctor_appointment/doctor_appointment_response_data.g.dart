// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_appointment_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorAppointmentResponseData _$DoctorAppointmentResponseDataFromJson(
        Map<String, dynamic> json) =>
    DoctorAppointmentResponseData(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              GetDoctorAppointmentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$DoctorAppointmentResponseDataToJson(
        DoctorAppointmentResponseData instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
