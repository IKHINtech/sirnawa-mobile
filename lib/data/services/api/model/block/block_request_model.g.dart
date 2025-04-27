// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BlockRequestModel _$BlockRequestModelFromJson(Map<String, dynamic> json) =>
    _BlockRequestModel(
      id: json['id'] as String?,
      name: json['name'] as String,
      rtId: json['rt_id'] as String,
    );

Map<String, dynamic> _$BlockRequestModelToJson(_BlockRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rt_id': instance.rtId,
    };
