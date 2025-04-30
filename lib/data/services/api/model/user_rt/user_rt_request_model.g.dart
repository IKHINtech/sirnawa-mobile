// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_rt_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserRtRequestModel _$UserRtRequestModelFromJson(Map<String, dynamic> json) =>
    _UserRtRequestModel(
      id: json['id'] as String?,
      role: json['role'] as String,
      rtId: json['rt_id'] as String,
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$UserRtRequestModelToJson(_UserRtRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'rt_id': instance.rtId,
      'user_id': instance.userId,
    };
