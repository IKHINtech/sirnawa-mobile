// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ipl_bill_generate_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IplBillGenerateRequestModel {

@JsonKey(name: "due_date") int get dueDate;@JsonKey(name: "house_ids") List<String> get houseId;@JsonKey(name: "ipl_rate_id") String get iplRateId;@JsonKey(name: "is_all_house") bool get isAllHouse; int get month; int get year;@JsonKey(name: "rt_id") String get rtId;
/// Create a copy of IplBillGenerateRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IplBillGenerateRequestModelCopyWith<IplBillGenerateRequestModel> get copyWith => _$IplBillGenerateRequestModelCopyWithImpl<IplBillGenerateRequestModel>(this as IplBillGenerateRequestModel, _$identity);

  /// Serializes this IplBillGenerateRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IplBillGenerateRequestModel&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&const DeepCollectionEquality().equals(other.houseId, houseId)&&(identical(other.iplRateId, iplRateId) || other.iplRateId == iplRateId)&&(identical(other.isAllHouse, isAllHouse) || other.isAllHouse == isAllHouse)&&(identical(other.month, month) || other.month == month)&&(identical(other.year, year) || other.year == year)&&(identical(other.rtId, rtId) || other.rtId == rtId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dueDate,const DeepCollectionEquality().hash(houseId),iplRateId,isAllHouse,month,year,rtId);

@override
String toString() {
  return 'IplBillGenerateRequestModel(dueDate: $dueDate, houseId: $houseId, iplRateId: $iplRateId, isAllHouse: $isAllHouse, month: $month, year: $year, rtId: $rtId)';
}


}

/// @nodoc
abstract mixin class $IplBillGenerateRequestModelCopyWith<$Res>  {
  factory $IplBillGenerateRequestModelCopyWith(IplBillGenerateRequestModel value, $Res Function(IplBillGenerateRequestModel) _then) = _$IplBillGenerateRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "due_date") int dueDate,@JsonKey(name: "house_ids") List<String> houseId,@JsonKey(name: "ipl_rate_id") String iplRateId,@JsonKey(name: "is_all_house") bool isAllHouse, int month, int year,@JsonKey(name: "rt_id") String rtId
});




}
/// @nodoc
class _$IplBillGenerateRequestModelCopyWithImpl<$Res>
    implements $IplBillGenerateRequestModelCopyWith<$Res> {
  _$IplBillGenerateRequestModelCopyWithImpl(this._self, this._then);

  final IplBillGenerateRequestModel _self;
  final $Res Function(IplBillGenerateRequestModel) _then;

/// Create a copy of IplBillGenerateRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dueDate = null,Object? houseId = null,Object? iplRateId = null,Object? isAllHouse = null,Object? month = null,Object? year = null,Object? rtId = null,}) {
  return _then(_self.copyWith(
dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as int,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as List<String>,iplRateId: null == iplRateId ? _self.iplRateId : iplRateId // ignore: cast_nullable_to_non_nullable
as String,isAllHouse: null == isAllHouse ? _self.isAllHouse : isAllHouse // ignore: cast_nullable_to_non_nullable
as bool,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _IplBillGenerateRequestModel implements IplBillGenerateRequestModel {
  const _IplBillGenerateRequestModel({@JsonKey(name: "due_date") required this.dueDate, @JsonKey(name: "house_ids") required final  List<String> houseId, @JsonKey(name: "ipl_rate_id") required this.iplRateId, @JsonKey(name: "is_all_house") required this.isAllHouse, required this.month, required this.year, @JsonKey(name: "rt_id") required this.rtId}): _houseId = houseId;
  factory _IplBillGenerateRequestModel.fromJson(Map<String, dynamic> json) => _$IplBillGenerateRequestModelFromJson(json);

@override@JsonKey(name: "due_date") final  int dueDate;
 final  List<String> _houseId;
@override@JsonKey(name: "house_ids") List<String> get houseId {
  if (_houseId is EqualUnmodifiableListView) return _houseId;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_houseId);
}

@override@JsonKey(name: "ipl_rate_id") final  String iplRateId;
@override@JsonKey(name: "is_all_house") final  bool isAllHouse;
@override final  int month;
@override final  int year;
@override@JsonKey(name: "rt_id") final  String rtId;

/// Create a copy of IplBillGenerateRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IplBillGenerateRequestModelCopyWith<_IplBillGenerateRequestModel> get copyWith => __$IplBillGenerateRequestModelCopyWithImpl<_IplBillGenerateRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IplBillGenerateRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IplBillGenerateRequestModel&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&const DeepCollectionEquality().equals(other._houseId, _houseId)&&(identical(other.iplRateId, iplRateId) || other.iplRateId == iplRateId)&&(identical(other.isAllHouse, isAllHouse) || other.isAllHouse == isAllHouse)&&(identical(other.month, month) || other.month == month)&&(identical(other.year, year) || other.year == year)&&(identical(other.rtId, rtId) || other.rtId == rtId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dueDate,const DeepCollectionEquality().hash(_houseId),iplRateId,isAllHouse,month,year,rtId);

@override
String toString() {
  return 'IplBillGenerateRequestModel(dueDate: $dueDate, houseId: $houseId, iplRateId: $iplRateId, isAllHouse: $isAllHouse, month: $month, year: $year, rtId: $rtId)';
}


}

/// @nodoc
abstract mixin class _$IplBillGenerateRequestModelCopyWith<$Res> implements $IplBillGenerateRequestModelCopyWith<$Res> {
  factory _$IplBillGenerateRequestModelCopyWith(_IplBillGenerateRequestModel value, $Res Function(_IplBillGenerateRequestModel) _then) = __$IplBillGenerateRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "due_date") int dueDate,@JsonKey(name: "house_ids") List<String> houseId,@JsonKey(name: "ipl_rate_id") String iplRateId,@JsonKey(name: "is_all_house") bool isAllHouse, int month, int year,@JsonKey(name: "rt_id") String rtId
});




}
/// @nodoc
class __$IplBillGenerateRequestModelCopyWithImpl<$Res>
    implements _$IplBillGenerateRequestModelCopyWith<$Res> {
  __$IplBillGenerateRequestModelCopyWithImpl(this._self, this._then);

  final _IplBillGenerateRequestModel _self;
  final $Res Function(_IplBillGenerateRequestModel) _then;

/// Create a copy of IplBillGenerateRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dueDate = null,Object? houseId = null,Object? iplRateId = null,Object? isAllHouse = null,Object? month = null,Object? year = null,Object? rtId = null,}) {
  return _then(_IplBillGenerateRequestModel(
dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as int,houseId: null == houseId ? _self._houseId : houseId // ignore: cast_nullable_to_non_nullable
as List<String>,iplRateId: null == iplRateId ? _self.iplRateId : iplRateId // ignore: cast_nullable_to_non_nullable
as String,isAllHouse: null == isAllHouse ? _self.isAllHouse : isAllHouse // ignore: cast_nullable_to_non_nullable
as bool,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
