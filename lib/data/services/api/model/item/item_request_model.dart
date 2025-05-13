import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_request_model.freezed.dart';
part 'item_request_model.g.dart';

@freezed
class ItemRequestModel with _$ItemRequestModel {
  const factory ItemRequestModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'rt_id') required String rtId,
    @JsonKey(name: 'item_type') required String itemType,
  }) = _ItemRequestModel;

  factory ItemRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ItemRequestModelFromJson(json);
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
