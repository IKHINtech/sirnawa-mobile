// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ronda_group_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RondaGroupMemberModel _$RondaGroupMemberModelFromJson(
  Map<String, dynamic> json,
) => _RondaGroupMemberModel(
  id: json['id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  houseId: json['house_id'] as String,
  residentId: json['resident_id'] as String,
  rondaGroupId: json['ronda_group_id'] as String,
  house:
      json['house'] == null
          ? null
          : HouseModel.fromJson(json['house'] as Map<String, dynamic>),
  resident:
      json['resident'] == null
          ? null
          : ResidentModel.fromJson(json['resident'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RondaGroupMemberModelToJson(
  _RondaGroupMemberModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'house_id': instance.houseId,
  'resident_id': instance.residentId,
  'ronda_group_id': instance.rondaGroupId,
  'house': instance.house,
  'resident': instance.resident,
};
