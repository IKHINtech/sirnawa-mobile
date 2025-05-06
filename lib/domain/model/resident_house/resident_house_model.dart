import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sirnawa_mobile/domain/model/house/house_model.dart';
import 'package:sirnawa_mobile/domain/model/resident/resident_model.dart';

part 'resident_house_model.freezed.dart';
part 'resident_house_model.g.dart';

@freezed
class ResidentHouseModel with _$ResidentHouseModel {
  const factory ResidentHouseModel({
    required String id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'resident_id') required String residentId,
    @JsonKey(name: 'house_id') required String houseId,
    @JsonKey(name: 'is_primary') required bool isPrimary,
    HouseModel? house,
    ResidentModel? resident,
  }) = _ResidentHouseModel;

  factory ResidentHouseModel.fromJson(Map<String, dynamic> json) =>
      _$ResidentHouseModelFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
