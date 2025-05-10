import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sirnawa_mobile/domain/model/ronda_group/ronda_group_model.dart';
import 'package:sirnawa_mobile/domain/model/rt/rt_model.dart';

part 'ronda_schedule_model.freezed.dart';
part 'ronda_schedule_model.g.dart';

@freezed
class RondaScheduleModel with _$RondaScheduleModel {
  const factory RondaScheduleModel({
   required String id,
    @JsonKey(name: 'date') required DateTime date,
    @JsonKey(name: 'rt_id') required String rtId,
    @JsonKey(name: 'group_id') required String groupId,
    @JsonKey(name: 'group') RondaGroupModel? group,
    @JsonKey(name: 'rt') RtModel? rt,
  }) = _RondaScheduleModel;

  factory RondaScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$RondaScheduleModelFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}