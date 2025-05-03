import 'package:freezed_annotation/freezed_annotation.dart';

part 'housing_area_request_model.freezed.dart';
part 'housing_area_request_model.g.dart';

@freezed
class HousingAreaRequestModel with _$HousingAreaRequestModel {
  const factory HousingAreaRequestModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') required String name,
  }) = _HousingAreaRequestModel;

  factory HousingAreaRequestModel.fromJson(Map<String, dynamic> json) =>
      _$HousingAreaRequestModelFromJson(json);
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
