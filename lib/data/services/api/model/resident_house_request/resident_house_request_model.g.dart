// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resident_house_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResidentHouseRequestModel _$ResidentHouseRequestModelFromJson(
  Map<String, dynamic> json,
) => _ResidentHouseRequestModel(
  id: json['id'] as String?,
  residentId: json['resident_id'] as String,
  houseId: json['house_id'] as String,
  isPrimary: json['is_primary'] as bool,
);

Map<String, dynamic> _$ResidentHouseRequestModelToJson(
  _ResidentHouseRequestModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'resident_id': instance.residentId,
  'house_id': instance.houseId,
  'is_primary': instance.isPrimary,
};
