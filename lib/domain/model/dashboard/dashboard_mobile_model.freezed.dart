// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_mobile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardMobileModel {

@JsonKey(name: "ronda_schedule") RondaScheduleModel? get rondaScheduleModel;@JsonKey(name: "announcement") AnnouncementModel? get announcementModel;@JsonKey(name: "ipl_bill") IplBillModel? get iplBill;
/// Create a copy of DashboardMobileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardMobileModelCopyWith<DashboardMobileModel> get copyWith => _$DashboardMobileModelCopyWithImpl<DashboardMobileModel>(this as DashboardMobileModel, _$identity);

  /// Serializes this DashboardMobileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardMobileModel&&(identical(other.rondaScheduleModel, rondaScheduleModel) || other.rondaScheduleModel == rondaScheduleModel)&&(identical(other.announcementModel, announcementModel) || other.announcementModel == announcementModel)&&(identical(other.iplBill, iplBill) || other.iplBill == iplBill));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rondaScheduleModel,announcementModel,iplBill);

@override
String toString() {
  return 'DashboardMobileModel(rondaScheduleModel: $rondaScheduleModel, announcementModel: $announcementModel, iplBill: $iplBill)';
}


}

/// @nodoc
abstract mixin class $DashboardMobileModelCopyWith<$Res>  {
  factory $DashboardMobileModelCopyWith(DashboardMobileModel value, $Res Function(DashboardMobileModel) _then) = _$DashboardMobileModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "ronda_schedule") RondaScheduleModel? rondaScheduleModel,@JsonKey(name: "announcement") AnnouncementModel? announcementModel,@JsonKey(name: "ipl_bill") IplBillModel? iplBill
});


$RondaScheduleModelCopyWith<$Res>? get rondaScheduleModel;$AnnouncementModelCopyWith<$Res>? get announcementModel;$IplBillModelCopyWith<$Res>? get iplBill;

}
/// @nodoc
class _$DashboardMobileModelCopyWithImpl<$Res>
    implements $DashboardMobileModelCopyWith<$Res> {
  _$DashboardMobileModelCopyWithImpl(this._self, this._then);

  final DashboardMobileModel _self;
  final $Res Function(DashboardMobileModel) _then;

/// Create a copy of DashboardMobileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rondaScheduleModel = freezed,Object? announcementModel = freezed,Object? iplBill = freezed,}) {
  return _then(_self.copyWith(
rondaScheduleModel: freezed == rondaScheduleModel ? _self.rondaScheduleModel : rondaScheduleModel // ignore: cast_nullable_to_non_nullable
as RondaScheduleModel?,announcementModel: freezed == announcementModel ? _self.announcementModel : announcementModel // ignore: cast_nullable_to_non_nullable
as AnnouncementModel?,iplBill: freezed == iplBill ? _self.iplBill : iplBill // ignore: cast_nullable_to_non_nullable
as IplBillModel?,
  ));
}
/// Create a copy of DashboardMobileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RondaScheduleModelCopyWith<$Res>? get rondaScheduleModel {
    if (_self.rondaScheduleModel == null) {
    return null;
  }

  return $RondaScheduleModelCopyWith<$Res>(_self.rondaScheduleModel!, (value) {
    return _then(_self.copyWith(rondaScheduleModel: value));
  });
}/// Create a copy of DashboardMobileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnouncementModelCopyWith<$Res>? get announcementModel {
    if (_self.announcementModel == null) {
    return null;
  }

  return $AnnouncementModelCopyWith<$Res>(_self.announcementModel!, (value) {
    return _then(_self.copyWith(announcementModel: value));
  });
}/// Create a copy of DashboardMobileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IplBillModelCopyWith<$Res>? get iplBill {
    if (_self.iplBill == null) {
    return null;
  }

  return $IplBillModelCopyWith<$Res>(_self.iplBill!, (value) {
    return _then(_self.copyWith(iplBill: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _DashboardMobileModel implements DashboardMobileModel {
  const _DashboardMobileModel({@JsonKey(name: "ronda_schedule") this.rondaScheduleModel, @JsonKey(name: "announcement") this.announcementModel, @JsonKey(name: "ipl_bill") this.iplBill});
  factory _DashboardMobileModel.fromJson(Map<String, dynamic> json) => _$DashboardMobileModelFromJson(json);

@override@JsonKey(name: "ronda_schedule") final  RondaScheduleModel? rondaScheduleModel;
@override@JsonKey(name: "announcement") final  AnnouncementModel? announcementModel;
@override@JsonKey(name: "ipl_bill") final  IplBillModel? iplBill;

/// Create a copy of DashboardMobileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardMobileModelCopyWith<_DashboardMobileModel> get copyWith => __$DashboardMobileModelCopyWithImpl<_DashboardMobileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardMobileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardMobileModel&&(identical(other.rondaScheduleModel, rondaScheduleModel) || other.rondaScheduleModel == rondaScheduleModel)&&(identical(other.announcementModel, announcementModel) || other.announcementModel == announcementModel)&&(identical(other.iplBill, iplBill) || other.iplBill == iplBill));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rondaScheduleModel,announcementModel,iplBill);

@override
String toString() {
  return 'DashboardMobileModel(rondaScheduleModel: $rondaScheduleModel, announcementModel: $announcementModel, iplBill: $iplBill)';
}


}

/// @nodoc
abstract mixin class _$DashboardMobileModelCopyWith<$Res> implements $DashboardMobileModelCopyWith<$Res> {
  factory _$DashboardMobileModelCopyWith(_DashboardMobileModel value, $Res Function(_DashboardMobileModel) _then) = __$DashboardMobileModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "ronda_schedule") RondaScheduleModel? rondaScheduleModel,@JsonKey(name: "announcement") AnnouncementModel? announcementModel,@JsonKey(name: "ipl_bill") IplBillModel? iplBill
});


@override $RondaScheduleModelCopyWith<$Res>? get rondaScheduleModel;@override $AnnouncementModelCopyWith<$Res>? get announcementModel;@override $IplBillModelCopyWith<$Res>? get iplBill;

}
/// @nodoc
class __$DashboardMobileModelCopyWithImpl<$Res>
    implements _$DashboardMobileModelCopyWith<$Res> {
  __$DashboardMobileModelCopyWithImpl(this._self, this._then);

  final _DashboardMobileModel _self;
  final $Res Function(_DashboardMobileModel) _then;

/// Create a copy of DashboardMobileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rondaScheduleModel = freezed,Object? announcementModel = freezed,Object? iplBill = freezed,}) {
  return _then(_DashboardMobileModel(
rondaScheduleModel: freezed == rondaScheduleModel ? _self.rondaScheduleModel : rondaScheduleModel // ignore: cast_nullable_to_non_nullable
as RondaScheduleModel?,announcementModel: freezed == announcementModel ? _self.announcementModel : announcementModel // ignore: cast_nullable_to_non_nullable
as AnnouncementModel?,iplBill: freezed == iplBill ? _self.iplBill : iplBill // ignore: cast_nullable_to_non_nullable
as IplBillModel?,
  ));
}

/// Create a copy of DashboardMobileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RondaScheduleModelCopyWith<$Res>? get rondaScheduleModel {
    if (_self.rondaScheduleModel == null) {
    return null;
  }

  return $RondaScheduleModelCopyWith<$Res>(_self.rondaScheduleModel!, (value) {
    return _then(_self.copyWith(rondaScheduleModel: value));
  });
}/// Create a copy of DashboardMobileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnouncementModelCopyWith<$Res>? get announcementModel {
    if (_self.announcementModel == null) {
    return null;
  }

  return $AnnouncementModelCopyWith<$Res>(_self.announcementModel!, (value) {
    return _then(_self.copyWith(announcementModel: value));
  });
}/// Create a copy of DashboardMobileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IplBillModelCopyWith<$Res>? get iplBill {
    if (_self.iplBill == null) {
    return null;
  }

  return $IplBillModelCopyWith<$Res>(_self.iplBill!, (value) {
    return _then(_self.copyWith(iplBill: value));
  });
}
}

// dart format on
