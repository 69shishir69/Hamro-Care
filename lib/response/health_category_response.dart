import 'package:hospital_management_system/models/health_category.dart';
import 'package:json_annotation/json_annotation.dart';

part "health_category_response.g.dart";

@JsonSerializable()
class HealthCategoryResponse {
  bool? success;
  List<HealthCategory>? data;

  HealthCategoryResponse({this.data, this.success});

  factory HealthCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$HealthCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HealthCategoryResponseToJson(this);
}
