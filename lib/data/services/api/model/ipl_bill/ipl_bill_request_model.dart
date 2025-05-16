import 'package:freezed_annotation/freezed_annotation.dart';

part 'ipl_bill_request_model.freezed.dart';
part 'ipl_bill_request_model.g.dart';

@freezed
class IplBillRequestModel with _$IplBillRequestModel {
  const factory IplBillRequestModel({
    @JsonKey(name: "due_date") required String dueDate,
    @JsonKey(name: "house_id") required String houseId,
    @JsonKey(name: "ipl_rate_id") required String iplRateId,
    required int month,
    required String penalty,
    @JsonKey(name: "rt_id") required String rtId,
    required String status,
    @JsonKey(name: "total_amount") required double totalAmount,
    required int year,
  }) = _IplBillRequestModel;

  factory IplBillRequestModel.fromJson(Map<String, dynamic> json) =>
      _$IplBillRequestModelFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
