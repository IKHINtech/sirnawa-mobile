// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ipl_bill_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IplBillModel {

 String get id;@JsonKey(name: "due_date") String get dueDate;@JsonKey(name: "house_id") String get houseId;@JsonKey(name: "ipl_rate_id") String get iplRateId; int get month; String? get penalty;@JsonKey(name: "rt_id") String get rtId; String get status;@JsonKey(name: "total_amount") double get totalAmount; int get year; HouseModel? get house; RtModel? get rt;
/// Create a copy of IplBillModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IplBillModelCopyWith<IplBillModel> get copyWith => _$IplBillModelCopyWithImpl<IplBillModel>(this as IplBillModel, _$identity);

  /// Serializes this IplBillModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IplBillModel&&(identical(other.id, id) || other.id == id)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.iplRateId, iplRateId) || other.iplRateId == iplRateId)&&(identical(other.month, month) || other.month == month)&&(identical(other.penalty, penalty) || other.penalty == penalty)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.year, year) || other.year == year)&&(identical(other.house, house) || other.house == house)&&(identical(other.rt, rt) || other.rt == rt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,dueDate,houseId,iplRateId,month,penalty,rtId,status,totalAmount,year,house,rt);

@override
String toString() {
  return 'IplBillModel(id: $id, dueDate: $dueDate, houseId: $houseId, iplRateId: $iplRateId, month: $month, penalty: $penalty, rtId: $rtId, status: $status, totalAmount: $totalAmount, year: $year, house: $house, rt: $rt)';
}


}

/// @nodoc
abstract mixin class $IplBillModelCopyWith<$Res>  {
  factory $IplBillModelCopyWith(IplBillModel value, $Res Function(IplBillModel) _then) = _$IplBillModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: "due_date") String dueDate,@JsonKey(name: "house_id") String houseId,@JsonKey(name: "ipl_rate_id") String iplRateId, int month, String? penalty,@JsonKey(name: "rt_id") String rtId, String status,@JsonKey(name: "total_amount") double totalAmount, int year, HouseModel? house, RtModel? rt
});


$HouseModelCopyWith<$Res>? get house;$RtModelCopyWith<$Res>? get rt;

}
/// @nodoc
class _$IplBillModelCopyWithImpl<$Res>
    implements $IplBillModelCopyWith<$Res> {
  _$IplBillModelCopyWithImpl(this._self, this._then);

  final IplBillModel _self;
  final $Res Function(IplBillModel) _then;

/// Create a copy of IplBillModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? dueDate = null,Object? houseId = null,Object? iplRateId = null,Object? month = null,Object? penalty = freezed,Object? rtId = null,Object? status = null,Object? totalAmount = null,Object? year = null,Object? house = freezed,Object? rt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,iplRateId: null == iplRateId ? _self.iplRateId : iplRateId // ignore: cast_nullable_to_non_nullable
as String,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,penalty: freezed == penalty ? _self.penalty : penalty // ignore: cast_nullable_to_non_nullable
as String?,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,house: freezed == house ? _self.house : house // ignore: cast_nullable_to_non_nullable
as HouseModel?,rt: freezed == rt ? _self.rt : rt // ignore: cast_nullable_to_non_nullable
as RtModel?,
  ));
}
/// Create a copy of IplBillModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HouseModelCopyWith<$Res>? get house {
    if (_self.house == null) {
    return null;
  }

  return $HouseModelCopyWith<$Res>(_self.house!, (value) {
    return _then(_self.copyWith(house: value));
  });
}/// Create a copy of IplBillModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RtModelCopyWith<$Res>? get rt {
    if (_self.rt == null) {
    return null;
  }

  return $RtModelCopyWith<$Res>(_self.rt!, (value) {
    return _then(_self.copyWith(rt: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _IplBillModel implements IplBillModel {
  const _IplBillModel({required this.id, @JsonKey(name: "due_date") required this.dueDate, @JsonKey(name: "house_id") required this.houseId, @JsonKey(name: "ipl_rate_id") required this.iplRateId, required this.month, this.penalty, @JsonKey(name: "rt_id") required this.rtId, required this.status, @JsonKey(name: "total_amount") required this.totalAmount, required this.year, this.house, this.rt});
  factory _IplBillModel.fromJson(Map<String, dynamic> json) => _$IplBillModelFromJson(json);

@override final  String id;
@override@JsonKey(name: "due_date") final  String dueDate;
@override@JsonKey(name: "house_id") final  String houseId;
@override@JsonKey(name: "ipl_rate_id") final  String iplRateId;
@override final  int month;
@override final  String? penalty;
@override@JsonKey(name: "rt_id") final  String rtId;
@override final  String status;
@override@JsonKey(name: "total_amount") final  double totalAmount;
@override final  int year;
@override final  HouseModel? house;
@override final  RtModel? rt;

/// Create a copy of IplBillModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IplBillModelCopyWith<_IplBillModel> get copyWith => __$IplBillModelCopyWithImpl<_IplBillModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IplBillModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IplBillModel&&(identical(other.id, id) || other.id == id)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.iplRateId, iplRateId) || other.iplRateId == iplRateId)&&(identical(other.month, month) || other.month == month)&&(identical(other.penalty, penalty) || other.penalty == penalty)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.year, year) || other.year == year)&&(identical(other.house, house) || other.house == house)&&(identical(other.rt, rt) || other.rt == rt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,dueDate,houseId,iplRateId,month,penalty,rtId,status,totalAmount,year,house,rt);

@override
String toString() {
  return 'IplBillModel(id: $id, dueDate: $dueDate, houseId: $houseId, iplRateId: $iplRateId, month: $month, penalty: $penalty, rtId: $rtId, status: $status, totalAmount: $totalAmount, year: $year, house: $house, rt: $rt)';
}


}

/// @nodoc
abstract mixin class _$IplBillModelCopyWith<$Res> implements $IplBillModelCopyWith<$Res> {
  factory _$IplBillModelCopyWith(_IplBillModel value, $Res Function(_IplBillModel) _then) = __$IplBillModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: "due_date") String dueDate,@JsonKey(name: "house_id") String houseId,@JsonKey(name: "ipl_rate_id") String iplRateId, int month, String? penalty,@JsonKey(name: "rt_id") String rtId, String status,@JsonKey(name: "total_amount") double totalAmount, int year, HouseModel? house, RtModel? rt
});


@override $HouseModelCopyWith<$Res>? get house;@override $RtModelCopyWith<$Res>? get rt;

}
/// @nodoc
class __$IplBillModelCopyWithImpl<$Res>
    implements _$IplBillModelCopyWith<$Res> {
  __$IplBillModelCopyWithImpl(this._self, this._then);

  final _IplBillModel _self;
  final $Res Function(_IplBillModel) _then;

/// Create a copy of IplBillModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? dueDate = null,Object? houseId = null,Object? iplRateId = null,Object? month = null,Object? penalty = freezed,Object? rtId = null,Object? status = null,Object? totalAmount = null,Object? year = null,Object? house = freezed,Object? rt = freezed,}) {
  return _then(_IplBillModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,iplRateId: null == iplRateId ? _self.iplRateId : iplRateId // ignore: cast_nullable_to_non_nullable
as String,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,penalty: freezed == penalty ? _self.penalty : penalty // ignore: cast_nullable_to_non_nullable
as String?,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,house: freezed == house ? _self.house : house // ignore: cast_nullable_to_non_nullable
as HouseModel?,rt: freezed == rt ? _self.rt : rt // ignore: cast_nullable_to_non_nullable
as RtModel?,
  ));
}

/// Create a copy of IplBillModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HouseModelCopyWith<$Res>? get house {
    if (_self.house == null) {
    return null;
  }

  return $HouseModelCopyWith<$Res>(_self.house!, (value) {
    return _then(_self.copyWith(house: value));
  });
}/// Create a copy of IplBillModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RtModelCopyWith<$Res>? get rt {
    if (_self.rt == null) {
    return null;
  }

  return $RtModelCopyWith<$Res>(_self.rt!, (value) {
    return _then(_self.copyWith(rt: value));
  });
}
}

// dart format on
