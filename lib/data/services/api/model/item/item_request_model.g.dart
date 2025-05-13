// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItemRequestModel _$ItemRequestModelFromJson(Map<String, dynamic> json) =>
    _ItemRequestModel(
      id: json['id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String,
      rtId: json['rt_id'] as String,
      itemType: json['item_type'] as String,
    );

Map<String, dynamic> _$ItemRequestModelToJson(_ItemRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'rt_id': instance.rtId,
      'item_type': instance.itemType,
    };
