import 'package:freezed_annotation/freezed_annotation.dart';

part 'housing_area_model.freezed.dart';
part 'housing_area_model.g.dart';

@freezed
class HousingAreaModel with _$HousingAreaModel {
  const factory HousingAreaModel({
    required String id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required String name,
  }) = _HousingAreaModel;

  factory HousingAreaModel.fromJson(Map<String, dynamic> json) =>
      _$HousingAreaModelFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
