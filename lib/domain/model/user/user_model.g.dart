// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  email: json['email'] as String,
  role: json['role'] as String,
  residentId: json['resident_id'] as String?,
  resident:
      json['resident'] == null
          ? null
          : ResidentModel.fromJson(json['resident'] as Map<String, dynamic>),
  userRTs:
      (json['user_rt'] as List<dynamic>?)
          ?.map((e) => UserRtModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'role': instance.role,
      'resident_id': instance.residentId,
      'resident': instance.resident,
      'user_rt': instance.userRTs,
    };
