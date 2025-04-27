// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rw_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RwModel _$RwModelFromJson(Map<String, dynamic> json) => _RwModel(
  id: json['id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  housingAreaId: json['housing_area_id'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$RwModelToJson(_RwModel instance) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'housing_area_id': instance.housingAreaId,
  'name': instance.name,
};
