// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ipl_bill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IplBillModel _$IplBillModelFromJson(Map<String, dynamic> json) =>
    _IplBillModel(
      id: json['id'] as String,
      dueDate: json['due_date'] as String,
      houseId: json['house_id'] as String,
      iplRateId: json['ipl_rate_id'] as String,
      month: (json['month'] as num).toInt(),
      penalty: json['penalty'] as String?,
      rtId: json['rt_id'] as String,
      status: json['status'] as String,
      totalAmount: (json['total_amount'] as num).toDouble(),
      year: (json['year'] as num).toInt(),
      house:
          json['house'] == null
              ? null
              : HouseModel.fromJson(json['house'] as Map<String, dynamic>),
      rt:
          json['rt'] == null
              ? null
              : RtModel.fromJson(json['rt'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IplBillModelToJson(_IplBillModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'due_date': instance.dueDate,
      'house_id': instance.houseId,
      'ipl_rate_id': instance.iplRateId,
      'month': instance.month,
      'penalty': instance.penalty,
      'rt_id': instance.rtId,
      'status': instance.status,
      'total_amount': instance.totalAmount,
      'year': instance.year,
      'house': instance.house,
      'rt': instance.rt,
    };
