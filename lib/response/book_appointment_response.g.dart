// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookAppointmentResponse _$BookAppointmentResponseFromJson(
        Map<String, dynamic> json) =>
    BookAppointmentResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AppointmentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$BookAppointmentResponseToJson(
        BookAppointmentResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
