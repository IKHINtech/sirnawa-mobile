import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sirnawa_mobile/domain/model/ronda_group_member/ronda_group_member_model.dart';

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
    @JsonKey(name: 'members') List<RondaGroupMemberModel>? rondaGroupMembers,
  }) = _RondaGroupModel;

  factory RondaGroupModel.fromJson(Map<String, dynamic> json) =>
      _$RondaGroupModelFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
