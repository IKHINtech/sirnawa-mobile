import 'package:freezed_annotation/freezed_annotation.dart';

part 'ronda_schedule_request_model.freezed.dart';
part 'ronda_schedule_request_model.g.dart';

@freezed
class RondaScheduleRequestModel with _$RondaScheduleRequestModel {
  const factory RondaScheduleRequestModel({
    String? id,
    @JsonKey(name: 'date') required String date,
    @JsonKey(name: 'rt_id') required String rtId,
    @JsonKey(name: 'group_id') required String groupId,
  }) = _RondaScheduleRequestModel;

  factory RondaScheduleRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RondaScheduleRequestModelFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
