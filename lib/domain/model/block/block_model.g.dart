// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BlockModel _$BlockModelFromJson(Map<String, dynamic> json) => _BlockModel(
  id: json['id'] as String,
  rtId: json['rt_id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  name: json['name'] as String,
);

Map<String, dynamic> _$BlockModelToJson(_BlockModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rt_id': instance.rtId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'name': instance.name,
    };
