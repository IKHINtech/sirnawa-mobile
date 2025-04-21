import 'package:freezed_annotation/freezed_annotation.dart';

part 'rt_model.freezed.dart';
part 'rt_model.g.dart';

@freezed
class RtModel with _$RtModel {
  const factory RtModel({
    required String id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'rw_id') required String rwId,
    required String name,
  }) = _RtModel;

  factory RtModel.fromJson(Map<String, dynamic> json) =>
      _$RtModelFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
