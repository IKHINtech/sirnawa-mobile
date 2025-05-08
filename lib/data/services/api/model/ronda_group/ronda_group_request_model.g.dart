// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ronda_group_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RondaGroupRequestModel _$RondaGroupRequestModelFromJson(
  Map<String, dynamic> json,
) => _RondaGroupRequestModel(
  id: json['id'] as String?,
  rtId: json['rt_id'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$RondaGroupRequestModelToJson(
  _RondaGroupRequestModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'rt_id': instance.rtId,
  'name': instance.name,
};
