import 'package:freezed_annotation/freezed_annotation.dart';

part 'block_request_model.freezed.dart';
part 'block_request_model.g.dart';

@freezed
class BlockRequestModel with _$BlockRequestModel {
  const factory BlockRequestModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'rt_id') required String rtId,
  }) = _BlockRequestModel;

  factory BlockRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BlockRequestModelFromJson(json);
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
