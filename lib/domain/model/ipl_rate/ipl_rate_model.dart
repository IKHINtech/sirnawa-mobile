import 'package:freezed_annotation/freezed_annotation.dart';

part 'ipl_rate_model.freezed.dart';
part 'ipl_rate_model.g.dart';

@freezed
class IplRateModel with _$IplRateModel {
  const factory IplRateModel({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'amount') required int ammount,
    @JsonKey(name: 'block_id') required String blockId,
    @JsonKey(name: 'rt_id') required int rtId,
    @JsonKey(name: 'house_type') required String houseType,
    @JsonKey(name: 'start_date') required String startDate,
  }) = _IplRateModel;

  factory IplRateModel.fromJson(Map<String, dynamic> json) =>
      _$IplRateModelFromJson(json);
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
