// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ipl_rate_detail_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IplRateDetailRequestModel _$IplRateDetailRequestModelFromJson(
  Map<String, dynamic> json,
) => _IplRateDetailRequestModel(
  id: json['id'] as String?,
  amount: (json['amount'] as num).toInt(),
  iplRateId: json['ipl_rate_id'] as String?,
  itemId: json['item_id'] as String,
);

Map<String, dynamic> _$IplRateDetailRequestModelToJson(
  _IplRateDetailRequestModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'amount': instance.amount,
  'ipl_rate_id': instance.iplRateId,
  'item_id': instance.itemId,
};
