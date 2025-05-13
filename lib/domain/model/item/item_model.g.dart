// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => _ItemModel(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  rtId: json['rt_id'] as String,
  itemType: json['item_type'] as String,
);

Map<String, dynamic> _$ItemModelToJson(_ItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'rt_id': instance.rtId,
      'item_type': instance.itemType,
    };
