// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthCategoryResponse _$HealthCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    HealthCategoryResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => HealthCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$HealthCategoryResponseToJson(
        HealthCategoryResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
