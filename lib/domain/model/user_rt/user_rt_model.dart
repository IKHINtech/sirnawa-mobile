import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sirnawa_mobile/domain/model/rt/rt_model.dart';

part 'user_rt_model.freezed.dart';
part 'user_rt_model.g.dart';

@freezed
class UserRtModel with _$UserRtModel {
  const factory UserRtModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'role') required String role,
    @JsonKey(name: 'rt_id') required String rtId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'rt') required RtModel rt,
  }) = _UserRtModel;

  factory UserRtModel.fromJson(Map<String, dynamic> json) =>
      _$UserRtModelFromJson(json);
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
