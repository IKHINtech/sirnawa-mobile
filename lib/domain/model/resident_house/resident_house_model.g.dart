// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resident_house_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResidentHouseModel _$ResidentHouseModelFromJson(Map<String, dynamic> json) =>
    _ResidentHouseModel(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      residentId: json['resident_id'] as String,
      houseId: json['house_id'] as String,
      isPrimary: json['is_primary'] as bool,
      house: HouseModel.fromJson(json['house'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResidentHouseModelToJson(_ResidentHouseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'resident_id': instance.residentId,
      'house_id': instance.houseId,
      'is_primary': instance.isPrimary,
      'house': instance.house,
    };
