import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sirnawa_mobile/domain/model/block/block_model.dart';
import 'package:sirnawa_mobile/domain/model/housing_area/housing_area_model.dart';
import 'package:sirnawa_mobile/domain/model/resident_house/resident_house_model.dart';
import 'package:sirnawa_mobile/domain/model/rt/rt_model.dart';
import 'package:sirnawa_mobile/domain/model/rw/rw_model.dart';

part 'house_model.freezed.dart';
part 'house_model.g.dart';

@freezed
class HouseModel with _$HouseModel {
  const factory HouseModel({
    required String id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required String number,
    @JsonKey(name: 'rw_id') required String rwId,
    @JsonKey(name: 'rt_id') required String rtId,
    @JsonKey(name: 'block_id') required String blockId,
    required String status,
    RwModel? rw,
    double? longitude,
    double? latitude,
    RtModel? rt,
    BlockModel? block,
    @JsonKey(name: 'housing_area') HousingAreaModel? hosuingArea,
    @JsonKey(name: 'resident_houses') List<ResidentHouseModel>? residentHouses,
  }) = _HouseModel;

  factory HouseModel.fromJson(Map<String, dynamic> json) =>
      _$HouseModelFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
