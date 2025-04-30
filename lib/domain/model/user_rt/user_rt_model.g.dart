// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_rt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserRtModel _$UserRtModelFromJson(Map<String, dynamic> json) => _UserRtModel(
  id: json['id'] as String?,
  role: json['role'] as String,
  rtId: json['rt_id'] as String,
  userId: json['user_id'] as String,
  rt: RtModel.fromJson(json['rt'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserRtModelToJson(_UserRtModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'rt_id': instance.rtId,
      'user_id': instance.userId,
      'rt': instance.rt,
    };
