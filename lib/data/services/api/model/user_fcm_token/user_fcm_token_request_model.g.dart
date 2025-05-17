// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_fcm_token_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserFcmTokenRequestModel _$UserFcmTokenRequestModelFromJson(
  Map<String, dynamic> json,
) => _UserFcmTokenRequestModel(
  id: json['id'] as String?,
  apVersion: json['app_version'] as String,
  deviceId: json['device_id'] as String,
  osVersion: json['os_version'] as String,
  deviceType: json['device_type'] as String,
  token: json['token'] as String,
);

Map<String, dynamic> _$UserFcmTokenRequestModelToJson(
  _UserFcmTokenRequestModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'app_version': instance.apVersion,
  'device_id': instance.deviceId,
  'os_version': instance.osVersion,
  'device_type': instance.deviceType,
  'token': instance.token,
};
