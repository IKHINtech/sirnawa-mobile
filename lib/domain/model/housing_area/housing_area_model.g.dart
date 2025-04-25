// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'housing_area_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HousingAreaModel _$HousingAreaModelFromJson(Map<String, dynamic> json) =>
    _HousingAreaModel(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      name: json['name'] as String,
    );

Map<String, dynamic> _$HousingAreaModelToJson(_HousingAreaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'name': instance.name,
    };
