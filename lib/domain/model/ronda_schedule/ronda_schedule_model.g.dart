// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ronda_schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RondaScheduleModel _$RondaScheduleModelFromJson(Map<String, dynamic> json) =>
    _RondaScheduleModel(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      rtId: json['rt_id'] as String,
      groupId: json['group_id'] as String,
      group:
          json['group'] == null
              ? null
              : RondaGroupModel.fromJson(json['group'] as Map<String, dynamic>),
      rt:
          json['rt'] == null
              ? null
              : RtModel.fromJson(json['rt'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RondaScheduleModelToJson(_RondaScheduleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'rt_id': instance.rtId,
      'group_id': instance.groupId,
      'group': instance.group,
      'rt': instance.rt,
    };
