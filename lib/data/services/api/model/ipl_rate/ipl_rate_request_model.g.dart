// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ipl_rate_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IplRateRequestModel _$IplRateRequestModelFromJson(Map<String, dynamic> json) =>
    _IplRateRequestModel(
      id: json['id'] as String?,
      ammount: (json['amount'] as num).toInt(),
      blockId: json['block_id'] as String?,
      rtId: json['rt_id'] as String,
      houseType: json['house_type'] as String?,
      startDate: json['start_date'] as String,
    );

Map<String, dynamic> _$IplRateRequestModelToJson(
  _IplRateRequestModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'amount': instance.ammount,
  'block_id': instance.blockId,
  'rt_id': instance.rtId,
  'house_type': instance.houseType,
  'start_date': instance.startDate,
};
