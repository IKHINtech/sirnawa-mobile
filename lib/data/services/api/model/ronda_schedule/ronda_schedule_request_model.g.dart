// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ronda_schedule_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RondaScheduleRequestModel _$RondaScheduleRequestModelFromJson(
  Map<String, dynamic> json,
) => _RondaScheduleRequestModel(
  id: json['id'] as String?,
  date: json['date'] as String,
  rtId: json['rt_id'] as String,
  groupId: json['group_id'] as String,
);

Map<String, dynamic> _$RondaScheduleRequestModelToJson(
  _RondaScheduleRequestModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date,
  'rt_id': instance.rtId,
  'group_id': instance.groupId,
};
