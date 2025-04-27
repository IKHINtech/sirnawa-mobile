import 'package:freezed_annotation/freezed_annotation.dart';

part 'rw_model.freezed.dart';
part 'rw_model.g.dart';

@freezed
class RwModel with _$RwModel {
  const factory RwModel({
    required String id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'housing_area_id') required String housingAreaId,
    required String name,
  }) = _RwModel;

  factory RwModel.fromJson(Map<String, dynamic> json) =>
      _$RwModelFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
