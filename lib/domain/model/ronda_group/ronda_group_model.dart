import 'package:freezed_annotation/freezed_annotation.dart';

part 'ronda_group_model.freezed.dart';
part 'ronda_group_model.g.dart';

@freezed
class RondaGroupModel with _$RondaGroupModel {
  const factory RondaGroupModel({
    required String id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'rt_id') required String rtId,
    required String name,
  }) = _RondaGroupModel;

  factory RondaGroupModel.fromJson(Map<String, dynamic> json) =>
      _$RondaGroupModelFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
