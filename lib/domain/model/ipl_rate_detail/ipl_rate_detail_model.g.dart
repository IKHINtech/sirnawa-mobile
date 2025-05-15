// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ipl_rate_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IplRateDetailModel _$IplRateDetailModelFromJson(Map<String, dynamic> json) =>
    _IplRateDetailModel(
      id: json['id'] as String?,
      amount: (json['amount'] as num).toInt(),
      iplRateId: json['ipl_rate_id'] as String?,
      itemId: json['item_id'] as String,
    );

Map<String, dynamic> _$IplRateDetailModelToJson(_IplRateDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'ipl_rate_id': instance.iplRateId,
      'item_id': instance.itemId,
    };
