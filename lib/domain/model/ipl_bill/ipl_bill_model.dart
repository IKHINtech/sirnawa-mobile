import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sirnawa_mobile/domain/model/house/house_model.dart';
import 'package:sirnawa_mobile/domain/model/rt/rt_model.dart';

part 'ipl_bill_model.freezed.dart';
part 'ipl_bill_model.g.dart';

@freezed
class IplBillModel with _$IplBillModel {
  const factory IplBillModel({
    required String id,
    @JsonKey(name: "due_date") required String dueDate,
    @JsonKey(name: "house_id") required String houseId,
    @JsonKey(name: "ipl_rate_id") required String iplRateId,
    required int month,
    String? penalty,
    @JsonKey(name: "rt_id") required String rtId,
    required String status,
    @JsonKey(name: "total_amount") required double totalAmount,
    required int year,
    HouseModel? house,
    RtModel? rt,
  }) = _IplBillModel;

  factory IplBillModel.fromJson(Map<String, dynamic> json) =>
      _$IplBillModelFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
