import 'package:freezed_annotation/freezed_annotation.dart';

part 'ipl_rate_detail_request_model.freezed.dart';
part 'ipl_rate_detail_request_model.g.dart';

@freezed
class IplRateDetailRequestModel with _$IplRateDetailRequestModel {
  const factory IplRateDetailRequestModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'amount') required int amount,
    @JsonKey(name: 'ipl_rate_id') String? iplRateId,
    @JsonKey(name: 'item_id') required String itemId,
  }) = _IplRateDetailRequestModel;

  factory IplRateDetailRequestModel.fromJson(Map<String, dynamic> json) =>
      _$IplRateDetailRequestModelFromJson(json);
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
