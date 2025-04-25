import 'package:freezed_annotation/freezed_annotation.dart';

part 'house_model.freezed.dart';
part 'house_model.g.dart';

@freezed
class HouseModel with _$HouseModel {
  const factory HouseModel({
    required int id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required String number,
    @JsonKey(name: 'rw_id') required String rwId,
    @JsonKey(name: 'rt_id') required String rtId,
    @JsonKey(name: 'block_id') required String blockId,
    required String status,
  }) = _HouseModel;

  factory HouseModel.fromJson(Map<String, dynamic> json) =>
      _$HouseModelFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
