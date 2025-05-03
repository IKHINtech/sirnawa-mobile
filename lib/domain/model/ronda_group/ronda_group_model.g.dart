// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ronda_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RondaGroupModel _$RondaGroupModelFromJson(Map<String, dynamic> json) =>
    _RondaGroupModel(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      rtId: json['rt_id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$RondaGroupModelToJson(_RondaGroupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'rt_id': instance.rtId,
      'name': instance.name,
    };
