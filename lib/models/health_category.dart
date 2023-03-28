import 'package:json_annotation/json_annotation.dart';

part "health_category.g.dart";

@JsonSerializable()
class HealthCategory {
  @JsonKey(name: "_id")
  String? id;
  String? name;

  HealthCategory({this.id, this.name});

  factory HealthCategory.fromJson(Map<String, dynamic> json) =>
      _$HealthCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$HealthCategoryToJson(this);
}
