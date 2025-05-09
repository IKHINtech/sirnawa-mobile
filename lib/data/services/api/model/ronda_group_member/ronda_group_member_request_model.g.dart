// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ronda_group_member_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RondaGroupMemberRequestModel _$RondaGroupMemberRequestModelFromJson(
  Map<String, dynamic> json,
) => _RondaGroupMemberRequestModel(
  id: json['id'] as String?,
  houseId: json['house_id'] as String,
  residentId: json['resident_id'] as String,
  groupId: json['group_id'] as String,
);

Map<String, dynamic> _$RondaGroupMemberRequestModelToJson(
  _RondaGroupMemberRequestModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'house_id': instance.houseId,
  'resident_id': instance.residentId,
  'group_id': instance.groupId,
};
