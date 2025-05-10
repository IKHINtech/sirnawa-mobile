// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ronda_group_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RondaGroupModel {

 String get id;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;@JsonKey(name: 'rt_id') String get rtId; String get name;@JsonKey(name: 'members') List<RondaGroupMemberModel>? get rondaGroupMembers; RtModel? get rt;@JsonKey(name: "total_member") int? get totalMembers;
/// Create a copy of RondaGroupModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RondaGroupModelCopyWith<RondaGroupModel> get copyWith => _$RondaGroupModelCopyWithImpl<RondaGroupModel>(this as RondaGroupModel, _$identity);

  /// Serializes this RondaGroupModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RondaGroupModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.rondaGroupMembers, rondaGroupMembers)&&(identical(other.rt, rt) || other.rt == rt)&&(identical(other.totalMembers, totalMembers) || other.totalMembers == totalMembers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,rtId,name,const DeepCollectionEquality().hash(rondaGroupMembers),rt,totalMembers);

@override
String toString() {
  return 'RondaGroupModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, rtId: $rtId, name: $name, rondaGroupMembers: $rondaGroupMembers, rt: $rt, totalMembers: $totalMembers)';
}


}

/// @nodoc
abstract mixin class $RondaGroupModelCopyWith<$Res>  {
  factory $RondaGroupModelCopyWith(RondaGroupModel value, $Res Function(RondaGroupModel) _then) = _$RondaGroupModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'rt_id') String rtId, String name,@JsonKey(name: 'members') List<RondaGroupMemberModel>? rondaGroupMembers, RtModel? rt,@JsonKey(name: "total_member") int? totalMembers
});


$RtModelCopyWith<$Res>? get rt;

}
/// @nodoc
class _$RondaGroupModelCopyWithImpl<$Res>
    implements $RondaGroupModelCopyWith<$Res> {
  _$RondaGroupModelCopyWithImpl(this._self, this._then);

  final RondaGroupModel _self;
  final $Res Function(RondaGroupModel) _then;

/// Create a copy of RondaGroupModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? rtId = null,Object? name = null,Object? rondaGroupMembers = freezed,Object? rt = freezed,Object? totalMembers = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,rondaGroupMembers: freezed == rondaGroupMembers ? _self.rondaGroupMembers : rondaGroupMembers // ignore: cast_nullable_to_non_nullable
as List<RondaGroupMemberModel>?,rt: freezed == rt ? _self.rt : rt // ignore: cast_nullable_to_non_nullable
as RtModel?,totalMembers: freezed == totalMembers ? _self.totalMembers : totalMembers // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of RondaGroupModel
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

class _RondaGroupModel implements RondaGroupModel {
  const _RondaGroupModel({required this.id, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'rt_id') required this.rtId, required this.name, @JsonKey(name: 'members') final  List<RondaGroupMemberModel>? rondaGroupMembers, this.rt, @JsonKey(name: "total_member") this.totalMembers}): _rondaGroupMembers = rondaGroupMembers;
  factory _RondaGroupModel.fromJson(Map<String, dynamic> json) => _$RondaGroupModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override@JsonKey(name: 'rt_id') final  String rtId;
@override final  String name;
 final  List<RondaGroupMemberModel>? _rondaGroupMembers;
@override@JsonKey(name: 'members') List<RondaGroupMemberModel>? get rondaGroupMembers {
  final value = _rondaGroupMembers;
  if (value == null) return null;
  if (_rondaGroupMembers is EqualUnmodifiableListView) return _rondaGroupMembers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  RtModel? rt;
@override@JsonKey(name: "total_member") final  int? totalMembers;

/// Create a copy of RondaGroupModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RondaGroupModelCopyWith<_RondaGroupModel> get copyWith => __$RondaGroupModelCopyWithImpl<_RondaGroupModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RondaGroupModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RondaGroupModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._rondaGroupMembers, _rondaGroupMembers)&&(identical(other.rt, rt) || other.rt == rt)&&(identical(other.totalMembers, totalMembers) || other.totalMembers == totalMembers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,rtId,name,const DeepCollectionEquality().hash(_rondaGroupMembers),rt,totalMembers);

@override
String toString() {
  return 'RondaGroupModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, rtId: $rtId, name: $name, rondaGroupMembers: $rondaGroupMembers, rt: $rt, totalMembers: $totalMembers)';
}


}

/// @nodoc
abstract mixin class _$RondaGroupModelCopyWith<$Res> implements $RondaGroupModelCopyWith<$Res> {
  factory _$RondaGroupModelCopyWith(_RondaGroupModel value, $Res Function(_RondaGroupModel) _then) = __$RondaGroupModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'rt_id') String rtId, String name,@JsonKey(name: 'members') List<RondaGroupMemberModel>? rondaGroupMembers, RtModel? rt,@JsonKey(name: "total_member") int? totalMembers
});


@override $RtModelCopyWith<$Res>? get rt;

}
/// @nodoc
class __$RondaGroupModelCopyWithImpl<$Res>
    implements _$RondaGroupModelCopyWith<$Res> {
  __$RondaGroupModelCopyWithImpl(this._self, this._then);

  final _RondaGroupModel _self;
  final $Res Function(_RondaGroupModel) _then;

/// Create a copy of RondaGroupModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? rtId = null,Object? name = null,Object? rondaGroupMembers = freezed,Object? rt = freezed,Object? totalMembers = freezed,}) {
  return _then(_RondaGroupModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,rondaGroupMembers: freezed == rondaGroupMembers ? _self._rondaGroupMembers : rondaGroupMembers // ignore: cast_nullable_to_non_nullable
as List<RondaGroupMemberModel>?,rt: freezed == rt ? _self.rt : rt // ignore: cast_nullable_to_non_nullable
as RtModel?,totalMembers: freezed == totalMembers ? _self.totalMembers : totalMembers // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of RondaGroupModel
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
