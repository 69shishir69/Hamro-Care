// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_hdt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentHDTModel _$AppointmentHDTModelFromJson(Map<String, dynamic> json) =>
    AppointmentHDTModel(
      id: json['_id'] as String?,
      healthCategoryID: json['healthCategoryID'] as String?,
      date: json['date'] as String?,
      time: (json['time'] as List<dynamic>).map((e) => e as String?).toList(),
    );

Map<String, dynamic> _$AppointmentHDTModelToJson(
        AppointmentHDTModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'healthCategoryID': instance.healthCategoryID,
      'date': instance.date,
      'time': instance.time,
    };
