// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rw_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RwRequestModel _$RwRequestModelFromJson(Map<String, dynamic> json) =>
    _RwRequestModel(
      id: json['id'] as String?,
      name: json['name'] as String,
      housingAreaId: json['housing_area_id'] as String,
    );

Map<String, dynamic> _$RwRequestModelToJson(_RwRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'housing_area_id': instance.housingAreaId,
    };
