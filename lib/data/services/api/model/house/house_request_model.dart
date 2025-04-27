import 'package:freezed_annotation/freezed_annotation.dart';

part 'house_request_model.freezed.dart';
part 'house_request_model.g.dart';

@freezed
class HouseRequestModel with _$HouseRequestModel {
  const factory HouseRequestModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'number') required String number,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'rt_id') required String rtId,
    @JsonKey(name: 'block_id') required String blockId,
  }) = _HouseRequestModel;

  factory HouseRequestModel.fromJson(Map<String, dynamic> json) =>
      _$HouseRequestModelFromJson(json);
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
