// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RtModel _$RtModelFromJson(Map<String, dynamic> json) => _RtModel(
  id: json['id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  rwId: json['rw_id'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$RtModelToJson(_RtModel instance) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'rw_id': instance.rwId,
  'name': instance.name,
};
