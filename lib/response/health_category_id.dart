import 'package:json_annotation/json_annotation.dart';
part 'health_category_id.g.dart';

@JsonSerializable()
class HealthCategoryId {
  bool? success;
  dynamic data;

  HealthCategoryId({this.data, this.success});

  factory HealthCategoryId.fromJson(Map<String, dynamic> json) =>
      _$HealthCategoryIdFromJson(json);

  Map<String, dynamic> toJson() => _$HealthCategoryIdToJson(this);
}
