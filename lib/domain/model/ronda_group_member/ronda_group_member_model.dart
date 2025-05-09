import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sirnawa_mobile/domain/model/house/house_model.dart';
import 'package:sirnawa_mobile/domain/model/resident/resident_model.dart';

part 'ronda_group_member_model.freezed.dart';
part 'ronda_group_member_model.g.dart';

@freezed
class RondaGroupMemberModel with _$RondaGroupMemberModel {
  const factory RondaGroupMemberModel({
    required String id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'house_id') required String houseId,
    @JsonKey(name: 'resident_id') required String residentId,
    @JsonKey(name: 'ronda_group_id') required String rondaGroupId,
    @JsonKey(name: 'house') HouseModel? house,
    @JsonKey(name: 'resident') ResidentModel? resident,
  }) = _RondaGroupMemberModel;

  factory RondaGroupMemberModel.fromJson(Map<String, dynamic> json) =>
      _$RondaGroupMemberModelFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
