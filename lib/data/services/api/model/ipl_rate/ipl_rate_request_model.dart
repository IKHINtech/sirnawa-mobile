import 'package:freezed_annotation/freezed_annotation.dart';

part 'ipl_rate_request_model.freezed.dart';
part 'ipl_rate_request_model.g.dart';

@freezed
class IplRateRequestModel with _$IplRateRequestModel {
  const factory IplRateRequestModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'amount') required int ammount,
    @JsonKey(name: 'block_id') String? blockId,
    @JsonKey(name: 'rt_id') required String rtId,
    @JsonKey(name: 'house_type') String? houseType,
    @JsonKey(name: 'start_date') required String startDate,
  }) = _IplRateRequestModel;

  factory IplRateRequestModel.fromJson(Map<String, dynamic> json) =>
      _$IplRateRequestModelFromJson(json);
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
