import 'package:json_annotation/json_annotation.dart';

class DoctorModel {
  @JsonKey(name: "_id")
  String? id;
  String? fname;
  String? lname;
  String? gender;
  int? age;
  String? username;
  String? email;
  int? phone;
  String? address;
  String? password;
  String? department;
  String? picture;

  DoctorModel({
    this.id,
    this.fname,
    this.lname,
    this.gender,
    this.age,
    this.username,
    this.email,
    this.phone,
    this.address,
    this.password,
    this.department,
    this.picture,
  });

  // converting to dart object from server json file
  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        id: json["_id"],
        fname: json["fname"],
        lname: json["lname"],
        gender: json["gender"],
        age: json["age"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        password: json["password"],
        department: json["department"],
        picture: json["picture"],
      );

  // converting to json format from dart object
  Map<String, dynamic> toJson() => {
        "_id": id,
        "fname": fname,
        "lname": lname,
        "gender": gender,
        "age": age,
        "username": username,
        "email": email,
        "phone": phone,
        "address": address,
        "password": password,
        "department": department,
        "picture": picture,
      };
}
