// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HouseModel _$HouseModelFromJson(Map<String, dynamic> json) => _HouseModel(
  id: json['id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  number: json['number'] as String,
  rwId: json['rw_id'] as String,
  rtId: json['rt_id'] as String,
  blockId: json['block_id'] as String,
  status: json['status'] as String,
  rw:
      json['rw'] == null
          ? null
          : RwModel.fromJson(json['rw'] as Map<String, dynamic>),
  rt:
      json['rt'] == null
          ? null
          : RtModel.fromJson(json['rt'] as Map<String, dynamic>),
  block:
      json['block'] == null
          ? null
          : BlockModel.fromJson(json['block'] as Map<String, dynamic>),
  hosuingArea:
      json['housing_area'] == null
          ? null
          : HousingAreaModel.fromJson(
            json['housing_area'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$HouseModelToJson(_HouseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'number': instance.number,
      'rw_id': instance.rwId,
      'rt_id': instance.rtId,
      'block_id': instance.blockId,
      'status': instance.status,
      'rw': instance.rw,
      'rt': instance.rt,
      'block': instance.block,
      'housing_area': instance.hosuingArea,
    };
