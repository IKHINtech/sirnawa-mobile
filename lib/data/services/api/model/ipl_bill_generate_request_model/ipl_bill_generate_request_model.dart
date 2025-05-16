import 'package:freezed_annotation/freezed_annotation.dart';

part 'ipl_bill_generate_request_model.freezed.dart';
part 'ipl_bill_generate_request_model.g.dart';

@freezed
class IplBillGenerateRequestModel with _$IplBillGenerateRequestModel {
  const factory IplBillGenerateRequestModel({
    @JsonKey(name: "due_date") required int dueDate,
    @JsonKey(name: "house_ids") required List<String> houseId,
    @JsonKey(name: "ipl_rate_id") required String iplRateId,
    @JsonKey(name: "is_all_house") required bool isAllHouse,
    required int month,
    required int year,
    @JsonKey(name: "rt_id") required String rtId,
  }) = _IplBillGenerateRequestModel;

  factory IplBillGenerateRequestModel.fromJson(Map<String, dynamic> json) =>
      _$IplBillGenerateRequestModelFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
