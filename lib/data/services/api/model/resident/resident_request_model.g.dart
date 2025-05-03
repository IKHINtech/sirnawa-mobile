// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resident_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResidentRequestModel _$ResidentRequestModelFromJson(
  Map<String, dynamic> json,
) => _ResidentRequestModel(
  id: json['id'] as String?,
  name: json['name'] as String,
  nik: json['nik'] as String,
  phoneNumber: json['phone_number'] as String?,
  email: json['email'] as String?,
  birthDate: json['birth_date'] as String,
  gender: json['gender'] as String,
  job: json['job'] as String,
  isHeadOfFamily: json['is_head_of_family'] as bool,
  rtId: json['rt_id'] as String,
  role: json['role'] as String,
);

Map<String, dynamic> _$ResidentRequestModelToJson(
  _ResidentRequestModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'nik': instance.nik,
  'phone_number': instance.phoneNumber,
  'email': instance.email,
  'birth_date': instance.birthDate,
  'gender': instance.gender,
  'job': instance.job,
  'is_head_of_family': instance.isHeadOfFamily,
  'rt_id': instance.rtId,
  'role': instance.role,
};
