// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_hdt_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentHDTResponse _$AppointmentHDTResponseFromJson(
        Map<String, dynamic> json) =>
    AppointmentHDTResponse(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AppointmentHDTModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppointmentHDTResponseToJson(
        AppointmentHDTResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
