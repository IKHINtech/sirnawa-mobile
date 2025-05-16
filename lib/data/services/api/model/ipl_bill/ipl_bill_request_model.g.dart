// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ipl_bill_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IplBillRequestModel _$IplBillRequestModelFromJson(Map<String, dynamic> json) =>
    _IplBillRequestModel(
      dueDate: json['due_date'] as String,
      houseId: json['house_id'] as String,
      iplRateId: json['ipl_rate_id'] as String,
      month: (json['month'] as num).toInt(),
      penalty: json['penalty'] as String,
      rtId: json['rt_id'] as String,
      status: json['status'] as String,
      totalAmount: (json['total_amount'] as num).toDouble(),
      year: (json['year'] as num).toInt(),
    );

Map<String, dynamic> _$IplBillRequestModelToJson(
  _IplBillRequestModel instance,
) => <String, dynamic>{
  'due_date': instance.dueDate,
  'house_id': instance.houseId,
  'ipl_rate_id': instance.iplRateId,
  'month': instance.month,
  'penalty': instance.penalty,
  'rt_id': instance.rtId,
  'status': instance.status,
  'total_amount': instance.totalAmount,
  'year': instance.year,
};
