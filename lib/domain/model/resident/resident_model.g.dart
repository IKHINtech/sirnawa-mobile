// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resident_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResidentModel _$ResidentModelFromJson(Map<String, dynamic> json) =>
    _ResidentModel(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      name: json['name'] as String,
      nik: json['nik'] as String,
      phoneNumber: json['phone_number'] as String,
      gender: json['gender'] as String,
      birthDate: DateTime.parse(json['birth_date'] as String),
      job: json['job'] as String,
      isHeadOfFamily: json['is_head_of_family'] as bool,
      residentHouses:
          (json['resident_houses'] as List<dynamic>?)
              ?.map(
                (e) => ResidentHouseModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );

Map<String, dynamic> _$ResidentModelToJson(_ResidentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'name': instance.name,
      'nik': instance.nik,
      'phone_number': instance.phoneNumber,
      'gender': instance.gender,
      'birth_date': instance.birthDate.toIso8601String(),
      'job': instance.job,
      'is_head_of_family': instance.isHeadOfFamily,
      'resident_houses': instance.residentHouses,
    };
