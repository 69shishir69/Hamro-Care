import 'package:json_annotation/json_annotation.dart';

part "patient_profile.g.dart";

@JsonSerializable()
class PatientProfile {
  String? fname;
  String? lname;
  String? gender;
  String? age;
  String? username;
  String? phone;
  String? address;
  // ignore: non_constant_identifier_names

  PatientProfile({
    this.fname,
    this.lname,
    this.gender,
    this.age,
    this.username,
    this.phone,
    this.address,
    // ignore: non_constant_identifier_names
  });

  factory PatientProfile.fromJson(Map<String, dynamic> json) =>
      _$PatientProfileFromJson(json);

  Map<String, dynamic> toJson() => _$PatientProfileToJson(this);
}
