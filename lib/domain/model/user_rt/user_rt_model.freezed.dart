// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_rt_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserRtModel {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'role') String get role;@JsonKey(name: 'rt_id') String get rtId;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'rt') RtModel get rt;
/// Create a copy of UserRtModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRtModelCopyWith<UserRtModel> get copyWith => _$UserRtModelCopyWithImpl<UserRtModel>(this as UserRtModel, _$identity);

  /// Serializes this UserRtModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRtModel&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.rt, rt) || other.rt == rt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,role,rtId,userId,rt);

@override
String toString() {
  return 'UserRtModel(id: $id, role: $role, rtId: $rtId, userId: $userId, rt: $rt)';
}


}

/// @nodoc
abstract mixin class $UserRtModelCopyWith<$Res>  {
  factory $UserRtModelCopyWith(UserRtModel value, $Res Function(UserRtModel) _then) = _$UserRtModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'role') String role,@JsonKey(name: 'rt_id') String rtId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'rt') RtModel rt
});


$RtModelCopyWith<$Res> get rt;

}
/// @nodoc
class _$UserRtModelCopyWithImpl<$Res>
    implements $UserRtModelCopyWith<$Res> {
  _$UserRtModelCopyWithImpl(this._self, this._then);

  final UserRtModel _self;
  final $Res Function(UserRtModel) _then;

/// Create a copy of UserRtModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? role = null,Object? rtId = null,Object? userId = null,Object? rt = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,rt: null == rt ? _self.rt : rt // ignore: cast_nullable_to_non_nullable
as RtModel,
  ));
}
/// Create a copy of UserRtModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RtModelCopyWith<$Res> get rt {
  
  return $RtModelCopyWith<$Res>(_self.rt, (value) {
    return _then(_self.copyWith(rt: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _UserRtModel implements UserRtModel {
  const _UserRtModel({@JsonKey(name: 'id') this.id, @JsonKey(name: 'role') required this.role, @JsonKey(name: 'rt_id') required this.rtId, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'rt') required this.rt});
  factory _UserRtModel.fromJson(Map<String, dynamic> json) => _$UserRtModelFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'role') final  String role;
@override@JsonKey(name: 'rt_id') final  String rtId;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'rt') final  RtModel rt;

/// Create a copy of UserRtModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserRtModelCopyWith<_UserRtModel> get copyWith => __$UserRtModelCopyWithImpl<_UserRtModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserRtModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserRtModel&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.rt, rt) || other.rt == rt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,role,rtId,userId,rt);

@override
String toString() {
  return 'UserRtModel(id: $id, role: $role, rtId: $rtId, userId: $userId, rt: $rt)';
}


}

/// @nodoc
abstract mixin class _$UserRtModelCopyWith<$Res> implements $UserRtModelCopyWith<$Res> {
  factory _$UserRtModelCopyWith(_UserRtModel value, $Res Function(_UserRtModel) _then) = __$UserRtModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'role') String role,@JsonKey(name: 'rt_id') String rtId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'rt') RtModel rt
});


@override $RtModelCopyWith<$Res> get rt;

}
/// @nodoc
class __$UserRtModelCopyWithImpl<$Res>
    implements _$UserRtModelCopyWith<$Res> {
  __$UserRtModelCopyWithImpl(this._self, this._then);

  final _UserRtModel _self;
  final $Res Function(_UserRtModel) _then;

/// Create a copy of UserRtModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? role = null,Object? rtId = null,Object? userId = null,Object? rt = null,}) {
  return _then(_UserRtModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,rt: null == rt ? _self.rt : rt // ignore: cast_nullable_to_non_nullable
as RtModel,
  ));
}

/// Create a copy of UserRtModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RtModelCopyWith<$Res> get rt {
  
  return $RtModelCopyWith<$Res>(_self.rt, (value) {
    return _then(_self.copyWith(rt: value));
  });
}
}

// dart format on
