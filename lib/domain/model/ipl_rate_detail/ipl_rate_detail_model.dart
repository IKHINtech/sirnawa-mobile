import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sirnawa_mobile/domain/model/item/item_model.dart';

part 'ipl_rate_detail_model.freezed.dart';
part 'ipl_rate_detail_model.g.dart';

@freezed
class IplRateDetailModel with _$IplRateDetailModel {
  const factory IplRateDetailModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'amount') required int amount,
    @JsonKey(name: 'ipl_rate_id') String? iplRateId,
    @JsonKey(name: 'item_id') required String itemId,
    ItemModel? item,
  }) = _IplRateDetailModel;

  factory IplRateDetailModel.fromJson(Map<String, dynamic> json) =>
      _$IplRateDetailModelFromJson(json);
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
