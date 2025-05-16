// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ipl_bill_generate_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IplBillGenerateRequestModel _$IplBillGenerateRequestModelFromJson(
  Map<String, dynamic> json,
) => _IplBillGenerateRequestModel(
  dueDate: (json['due_date'] as num).toInt(),
  houseId:
      (json['house_ids'] as List<dynamic>).map((e) => e as String).toList(),
  iplRateId: json['ipl_rate_id'] as String,
  isAllHouse: json['is_all_house'] as bool,
  month: (json['month'] as num).toInt(),
  year: (json['year'] as num).toInt(),
  rtId: json['rt_id'] as String,
);

Map<String, dynamic> _$IplBillGenerateRequestModelToJson(
  _IplBillGenerateRequestModel instance,
) => <String, dynamic>{
  'due_date': instance.dueDate,
  'house_ids': instance.houseId,
  'ipl_rate_id': instance.iplRateId,
  'is_all_house': instance.isAllHouse,
  'month': instance.month,
  'year': instance.year,
  'rt_id': instance.rtId,
};
