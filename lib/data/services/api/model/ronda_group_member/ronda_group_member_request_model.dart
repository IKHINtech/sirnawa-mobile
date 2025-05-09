import 'package:freezed_annotation/freezed_annotation.dart';

part 'ronda_group_member_request_model.freezed.dart';
part 'ronda_group_member_request_model.g.dart';

@freezed
class RondaGroupMemberRequestModel with _$RondaGroupMemberRequestModel {
  const factory RondaGroupMemberRequestModel({
    String? id,
    @JsonKey(name: 'house_id') required String houseId,
    @JsonKey(name: 'resident_id') required String residentId,
    @JsonKey(name: 'group_id') required String groupId,
  }) = _RondaGroupMemberRequestModel;

  factory RondaGroupMemberRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RondaGroupMemberRequestModelFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
