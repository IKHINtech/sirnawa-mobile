// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ipl_bill_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IplBillRequestModel {

@JsonKey(name: "due_date") String get dueDate;@JsonKey(name: "house_id") String get houseId;@JsonKey(name: "ipl_rate_id") String get iplRateId; int get month; String get penalty;@JsonKey(name: "rt_id") String get rtId; String get status;@JsonKey(name: "total_amount") double get totalAmount; int get year;
/// Create a copy of IplBillRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IplBillRequestModelCopyWith<IplBillRequestModel> get copyWith => _$IplBillRequestModelCopyWithImpl<IplBillRequestModel>(this as IplBillRequestModel, _$identity);

  /// Serializes this IplBillRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IplBillRequestModel&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.iplRateId, iplRateId) || other.iplRateId == iplRateId)&&(identical(other.month, month) || other.month == month)&&(identical(other.penalty, penalty) || other.penalty == penalty)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.year, year) || other.year == year));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dueDate,houseId,iplRateId,month,penalty,rtId,status,totalAmount,year);

@override
String toString() {
  return 'IplBillRequestModel(dueDate: $dueDate, houseId: $houseId, iplRateId: $iplRateId, month: $month, penalty: $penalty, rtId: $rtId, status: $status, totalAmount: $totalAmount, year: $year)';
}


}

/// @nodoc
abstract mixin class $IplBillRequestModelCopyWith<$Res>  {
  factory $IplBillRequestModelCopyWith(IplBillRequestModel value, $Res Function(IplBillRequestModel) _then) = _$IplBillRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "due_date") String dueDate,@JsonKey(name: "house_id") String houseId,@JsonKey(name: "ipl_rate_id") String iplRateId, int month, String penalty,@JsonKey(name: "rt_id") String rtId, String status,@JsonKey(name: "total_amount") double totalAmount, int year
});




}
/// @nodoc
class _$IplBillRequestModelCopyWithImpl<$Res>
    implements $IplBillRequestModelCopyWith<$Res> {
  _$IplBillRequestModelCopyWithImpl(this._self, this._then);

  final IplBillRequestModel _self;
  final $Res Function(IplBillRequestModel) _then;

/// Create a copy of IplBillRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dueDate = null,Object? houseId = null,Object? iplRateId = null,Object? month = null,Object? penalty = null,Object? rtId = null,Object? status = null,Object? totalAmount = null,Object? year = null,}) {
  return _then(_self.copyWith(
dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,iplRateId: null == iplRateId ? _self.iplRateId : iplRateId // ignore: cast_nullable_to_non_nullable
as String,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,penalty: null == penalty ? _self.penalty : penalty // ignore: cast_nullable_to_non_nullable
as String,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _IplBillRequestModel implements IplBillRequestModel {
  const _IplBillRequestModel({@JsonKey(name: "due_date") required this.dueDate, @JsonKey(name: "house_id") required this.houseId, @JsonKey(name: "ipl_rate_id") required this.iplRateId, required this.month, required this.penalty, @JsonKey(name: "rt_id") required this.rtId, required this.status, @JsonKey(name: "total_amount") required this.totalAmount, required this.year});
  factory _IplBillRequestModel.fromJson(Map<String, dynamic> json) => _$IplBillRequestModelFromJson(json);

@override@JsonKey(name: "due_date") final  String dueDate;
@override@JsonKey(name: "house_id") final  String houseId;
@override@JsonKey(name: "ipl_rate_id") final  String iplRateId;
@override final  int month;
@override final  String penalty;
@override@JsonKey(name: "rt_id") final  String rtId;
@override final  String status;
@override@JsonKey(name: "total_amount") final  double totalAmount;
@override final  int year;

/// Create a copy of IplBillRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IplBillRequestModelCopyWith<_IplBillRequestModel> get copyWith => __$IplBillRequestModelCopyWithImpl<_IplBillRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IplBillRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IplBillRequestModel&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.iplRateId, iplRateId) || other.iplRateId == iplRateId)&&(identical(other.month, month) || other.month == month)&&(identical(other.penalty, penalty) || other.penalty == penalty)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.year, year) || other.year == year));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dueDate,houseId,iplRateId,month,penalty,rtId,status,totalAmount,year);

@override
String toString() {
  return 'IplBillRequestModel(dueDate: $dueDate, houseId: $houseId, iplRateId: $iplRateId, month: $month, penalty: $penalty, rtId: $rtId, status: $status, totalAmount: $totalAmount, year: $year)';
}


}

/// @nodoc
abstract mixin class _$IplBillRequestModelCopyWith<$Res> implements $IplBillRequestModelCopyWith<$Res> {
  factory _$IplBillRequestModelCopyWith(_IplBillRequestModel value, $Res Function(_IplBillRequestModel) _then) = __$IplBillRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "due_date") String dueDate,@JsonKey(name: "house_id") String houseId,@JsonKey(name: "ipl_rate_id") String iplRateId, int month, String penalty,@JsonKey(name: "rt_id") String rtId, String status,@JsonKey(name: "total_amount") double totalAmount, int year
});




}
/// @nodoc
class __$IplBillRequestModelCopyWithImpl<$Res>
    implements _$IplBillRequestModelCopyWith<$Res> {
  __$IplBillRequestModelCopyWithImpl(this._self, this._then);

  final _IplBillRequestModel _self;
  final $Res Function(_IplBillRequestModel) _then;

/// Create a copy of IplBillRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dueDate = null,Object? houseId = null,Object? iplRateId = null,Object? month = null,Object? penalty = null,Object? rtId = null,Object? status = null,Object? totalAmount = null,Object? year = null,}) {
  return _then(_IplBillRequestModel(
dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,iplRateId: null == iplRateId ? _self.iplRateId : iplRateId // ignore: cast_nullable_to_non_nullable
as String,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,penalty: null == penalty ? _self.penalty : penalty // ignore: cast_nullable_to_non_nullable
as String,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
