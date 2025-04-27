// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HouseRequestModel _$HouseRequestModelFromJson(Map<String, dynamic> json) =>
    _HouseRequestModel(
      id: json['id'] as String?,
      number: json['number'] as String,
      status: json['status'] as String,
      rtId: json['rt_id'] as String,
      blockId: json['block_id'] as String,
    );

Map<String, dynamic> _$HouseRequestModelToJson(_HouseRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'status': instance.status,
      'rt_id': instance.rtId,
      'block_id': instance.blockId,
    };
