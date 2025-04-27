import 'package:freezed_annotation/freezed_annotation.dart';

part 'rw_request_model.freezed.dart';
part 'rw_request_model.g.dart';

@freezed
class RwRequestModel with _$RwRequestModel {
  const factory RwRequestModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'housing_area_id') required String housingAreaId,
  }) = _RwRequestModel;

  factory RwRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RwRequestModelFromJson(json);
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
