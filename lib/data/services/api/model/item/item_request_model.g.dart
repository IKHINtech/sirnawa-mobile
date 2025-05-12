// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItemRequestModel _$ItemRequestModelFromJson(Map<String, dynamic> json) =>
    _ItemRequestModel(
      id: json['id'] as String?,
      name: json['name'] as String,
      description: json['desctription'] as String,
      rtId: (json['rt_id'] as num).toInt(),
      itemType: json['item_type'] as String,
    );

Map<String, dynamic> _$ItemRequestModelToJson(_ItemRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'desctription': instance.description,
      'rt_id': instance.rtId,
      'item_type': instance.itemType,
    };
