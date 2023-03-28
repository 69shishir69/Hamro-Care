// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientProfile _$PatientProfileFromJson(Map<String, dynamic> json) =>
    PatientProfile(
      fname: json['fname'] as String?,
      lname: json['lname'] as String?,
      gender: json['gender'] as String?,
      age: json['age'] as String?,
      username: json['username'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$PatientProfileToJson(PatientProfile instance) =>
    <String, dynamic>{
      'fname': instance.fname,
      'lname': instance.lname,
      'gender': instance.gender,
      'age': instance.age,
      'username': instance.username,
      'phone': instance.phone,
      'address': instance.address,
    };
