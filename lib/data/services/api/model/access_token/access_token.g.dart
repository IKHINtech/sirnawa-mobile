// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccessToken _$AccessTokenFromJson(Map<String, dynamic> json) => _AccessToken(
  token: json['token'] as String,
  expiresIn: (json['expires_in'] as num).toInt(),
  refreshToken: json['refresh_token'] as String,
);

Map<String, dynamic> _$AccessTokenToJson(_AccessToken instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expires_in': instance.expiresIn,
      'refresh_token': instance.refreshToken,
    };
