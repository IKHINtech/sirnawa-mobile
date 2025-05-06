import 'package:freezed_annotation/freezed_annotation.dart';

part 'resident_house_request_model.freezed.dart';
part 'resident_house_request_model.g.dart';

@freezed
class ResidentHouseRequestModel with _$ResidentHouseRequestModel {
  const factory ResidentHouseRequestModel({
    String? id,
    @JsonKey(name: 'resident_id') required String residentId,
    @JsonKey(name: 'house_id') required String houseId,
    @JsonKey(name: 'is_primary') required bool isPrimary,
  }) = _ResidentHouseRequestModel;

  factory ResidentHouseRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ResidentHouseRequestModelFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
