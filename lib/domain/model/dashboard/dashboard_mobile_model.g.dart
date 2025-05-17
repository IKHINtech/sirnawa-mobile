// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_mobile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardMobileModel _$DashboardMobileModelFromJson(
  Map<String, dynamic> json,
) => _DashboardMobileModel(
  rondaScheduleModel:
      json['ronda_schedule'] == null
          ? null
          : RondaScheduleModel.fromJson(
            json['ronda_schedule'] as Map<String, dynamic>,
          ),
  announcementModel:
      json['announcement'] == null
          ? null
          : AnnouncementModel.fromJson(
            json['announcement'] as Map<String, dynamic>,
          ),
  iplBill:
      json['ipl_bill'] == null
          ? null
          : IplBillModel.fromJson(json['ipl_bill'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DashboardMobileModelToJson(
  _DashboardMobileModel instance,
) => <String, dynamic>{
  'ronda_schedule': instance.rondaScheduleModel,
  'announcement': instance.announcementModel,
  'ipl_bill': instance.iplBill,
};
