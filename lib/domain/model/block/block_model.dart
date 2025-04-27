import 'package:freezed_annotation/freezed_annotation.dart';

part 'block_model.freezed.dart';
part 'block_model.g.dart';

@freezed
class BlockModel with _$BlockModel {
  const factory BlockModel({
    required String id,
    @JsonKey(name: 'rt_id') required String rtId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required String name,
  }) = _BlockModel;

  factory BlockModel.fromJson(Map<String, dynamic> json) =>
      _$BlockModelFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
