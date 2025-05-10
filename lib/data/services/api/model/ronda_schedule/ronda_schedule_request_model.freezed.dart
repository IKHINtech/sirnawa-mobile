// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ronda_schedule_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RondaScheduleRequestModel {

 String? get id;@JsonKey(name: 'date') String get date;@JsonKey(name: 'rt_id') String get rtId;@JsonKey(name: 'group_id') String get groupId;
/// Create a copy of RondaScheduleRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RondaScheduleRequestModelCopyWith<RondaScheduleRequestModel> get copyWith => _$RondaScheduleRequestModelCopyWithImpl<RondaScheduleRequestModel>(this as RondaScheduleRequestModel, _$identity);

  /// Serializes this RondaScheduleRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RondaScheduleRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.groupId, groupId) || other.groupId == groupId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,rtId,groupId);

@override
String toString() {
  return 'RondaScheduleRequestModel(id: $id, date: $date, rtId: $rtId, groupId: $groupId)';
}


}

/// @nodoc
abstract mixin class $RondaScheduleRequestModelCopyWith<$Res>  {
  factory $RondaScheduleRequestModelCopyWith(RondaScheduleRequestModel value, $Res Function(RondaScheduleRequestModel) _then) = _$RondaScheduleRequestModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'date') String date,@JsonKey(name: 'rt_id') String rtId,@JsonKey(name: 'group_id') String groupId
});




}
/// @nodoc
class _$RondaScheduleRequestModelCopyWithImpl<$Res>
    implements $RondaScheduleRequestModelCopyWith<$Res> {
  _$RondaScheduleRequestModelCopyWithImpl(this._self, this._then);

  final RondaScheduleRequestModel _self;
  final $Res Function(RondaScheduleRequestModel) _then;

/// Create a copy of RondaScheduleRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? date = null,Object? rtId = null,Object? groupId = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RondaScheduleRequestModel implements RondaScheduleRequestModel {
  const _RondaScheduleRequestModel({this.id, @JsonKey(name: 'date') required this.date, @JsonKey(name: 'rt_id') required this.rtId, @JsonKey(name: 'group_id') required this.groupId});
  factory _RondaScheduleRequestModel.fromJson(Map<String, dynamic> json) => _$RondaScheduleRequestModelFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'date') final  String date;
@override@JsonKey(name: 'rt_id') final  String rtId;
@override@JsonKey(name: 'group_id') final  String groupId;

/// Create a copy of RondaScheduleRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RondaScheduleRequestModelCopyWith<_RondaScheduleRequestModel> get copyWith => __$RondaScheduleRequestModelCopyWithImpl<_RondaScheduleRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RondaScheduleRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RondaScheduleRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.groupId, groupId) || other.groupId == groupId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,rtId,groupId);

@override
String toString() {
  return 'RondaScheduleRequestModel(id: $id, date: $date, rtId: $rtId, groupId: $groupId)';
}


}

/// @nodoc
abstract mixin class _$RondaScheduleRequestModelCopyWith<$Res> implements $RondaScheduleRequestModelCopyWith<$Res> {
  factory _$RondaScheduleRequestModelCopyWith(_RondaScheduleRequestModel value, $Res Function(_RondaScheduleRequestModel) _then) = __$RondaScheduleRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'date') String date,@JsonKey(name: 'rt_id') String rtId,@JsonKey(name: 'group_id') String groupId
});




}
/// @nodoc
class __$RondaScheduleRequestModelCopyWithImpl<$Res>
    implements _$RondaScheduleRequestModelCopyWith<$Res> {
  __$RondaScheduleRequestModelCopyWithImpl(this._self, this._then);

  final _RondaScheduleRequestModel _self;
  final $Res Function(_RondaScheduleRequestModel) _then;

/// Create a copy of RondaScheduleRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? date = null,Object? rtId = null,Object? groupId = null,}) {
  return _then(_RondaScheduleRequestModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
