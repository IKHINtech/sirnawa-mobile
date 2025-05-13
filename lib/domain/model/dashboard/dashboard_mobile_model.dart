import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sirnawa_mobile/domain/model/announcement/announcement_model.dart';
import 'package:sirnawa_mobile/domain/model/ronda_schedule/ronda_schedule_model.dart';

part 'dashboard_mobile_model.freezed.dart';
part 'dashboard_mobile_model.g.dart';

@freezed
class DashboardMobileModel with _$DashboardMobileModel {
  const factory DashboardMobileModel({
    @JsonKey(name: "ronda_schedule") RondaScheduleModel? rondaScheduleModel,
    @JsonKey(name: "announcement") AnnouncementModel? announcementModel,
  }) = _DashboardMobileModel;
  factory DashboardMobileModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardMobileModelFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
