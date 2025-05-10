// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ronda_schedule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RondaScheduleModel {

 String get id;@JsonKey(name: 'date') DateTime get date;@JsonKey(name: 'rt_id') String get rtId;@JsonKey(name: 'group_id') String get groupId;@JsonKey(name: 'group') RondaGroupModel? get group;@JsonKey(name: 'rt') RtModel? get rt;
/// Create a copy of RondaScheduleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RondaScheduleModelCopyWith<RondaScheduleModel> get copyWith => _$RondaScheduleModelCopyWithImpl<RondaScheduleModel>(this as RondaScheduleModel, _$identity);

  /// Serializes this RondaScheduleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RondaScheduleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.group, group) || other.group == group)&&(identical(other.rt, rt) || other.rt == rt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,rtId,groupId,group,rt);

@override
String toString() {
  return 'RondaScheduleModel(id: $id, date: $date, rtId: $rtId, groupId: $groupId, group: $group, rt: $rt)';
}


}

/// @nodoc
abstract mixin class $RondaScheduleModelCopyWith<$Res>  {
  factory $RondaScheduleModelCopyWith(RondaScheduleModel value, $Res Function(RondaScheduleModel) _then) = _$RondaScheduleModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'date') DateTime date,@JsonKey(name: 'rt_id') String rtId,@JsonKey(name: 'group_id') String groupId,@JsonKey(name: 'group') RondaGroupModel? group,@JsonKey(name: 'rt') RtModel? rt
});


$RondaGroupModelCopyWith<$Res>? get group;$RtModelCopyWith<$Res>? get rt;

}
/// @nodoc
class _$RondaScheduleModelCopyWithImpl<$Res>
    implements $RondaScheduleModelCopyWith<$Res> {
  _$RondaScheduleModelCopyWithImpl(this._self, this._then);

  final RondaScheduleModel _self;
  final $Res Function(RondaScheduleModel) _then;

/// Create a copy of RondaScheduleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? date = null,Object? rtId = null,Object? groupId = null,Object? group = freezed,Object? rt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as RondaGroupModel?,rt: freezed == rt ? _self.rt : rt // ignore: cast_nullable_to_non_nullable
as RtModel?,
  ));
}
/// Create a copy of RondaScheduleModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RondaGroupModelCopyWith<$Res>? get group {
    if (_self.group == null) {
    return null;
  }

  return $RondaGroupModelCopyWith<$Res>(_self.group!, (value) {
    return _then(_self.copyWith(group: value));
  });
}/// Create a copy of RondaScheduleModel
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

class _RondaScheduleModel implements RondaScheduleModel {
  const _RondaScheduleModel({required this.id, @JsonKey(name: 'date') required this.date, @JsonKey(name: 'rt_id') required this.rtId, @JsonKey(name: 'group_id') required this.groupId, @JsonKey(name: 'group') this.group, @JsonKey(name: 'rt') this.rt});
  factory _RondaScheduleModel.fromJson(Map<String, dynamic> json) => _$RondaScheduleModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'date') final  DateTime date;
@override@JsonKey(name: 'rt_id') final  String rtId;
@override@JsonKey(name: 'group_id') final  String groupId;
@override@JsonKey(name: 'group') final  RondaGroupModel? group;
@override@JsonKey(name: 'rt') final  RtModel? rt;

/// Create a copy of RondaScheduleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RondaScheduleModelCopyWith<_RondaScheduleModel> get copyWith => __$RondaScheduleModelCopyWithImpl<_RondaScheduleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RondaScheduleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RondaScheduleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.group, group) || other.group == group)&&(identical(other.rt, rt) || other.rt == rt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,rtId,groupId,group,rt);

@override
String toString() {
  return 'RondaScheduleModel(id: $id, date: $date, rtId: $rtId, groupId: $groupId, group: $group, rt: $rt)';
}


}

/// @nodoc
abstract mixin class _$RondaScheduleModelCopyWith<$Res> implements $RondaScheduleModelCopyWith<$Res> {
  factory _$RondaScheduleModelCopyWith(_RondaScheduleModel value, $Res Function(_RondaScheduleModel) _then) = __$RondaScheduleModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'date') DateTime date,@JsonKey(name: 'rt_id') String rtId,@JsonKey(name: 'group_id') String groupId,@JsonKey(name: 'group') RondaGroupModel? group,@JsonKey(name: 'rt') RtModel? rt
});


@override $RondaGroupModelCopyWith<$Res>? get group;@override $RtModelCopyWith<$Res>? get rt;

}
/// @nodoc
class __$RondaScheduleModelCopyWithImpl<$Res>
    implements _$RondaScheduleModelCopyWith<$Res> {
  __$RondaScheduleModelCopyWithImpl(this._self, this._then);

  final _RondaScheduleModel _self;
  final $Res Function(_RondaScheduleModel) _then;

/// Create a copy of RondaScheduleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? date = null,Object? rtId = null,Object? groupId = null,Object? group = freezed,Object? rt = freezed,}) {
  return _then(_RondaScheduleModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as RondaGroupModel?,rt: freezed == rt ? _self.rt : rt // ignore: cast_nullable_to_non_nullable
as RtModel?,
  ));
}

/// Create a copy of RondaScheduleModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RondaGroupModelCopyWith<$Res>? get group {
    if (_self.group == null) {
    return null;
  }

  return $RondaGroupModelCopyWith<$Res>(_self.group!, (value) {
    return _then(_self.copyWith(group: value));
  });
}/// Create a copy of RondaScheduleModel
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
