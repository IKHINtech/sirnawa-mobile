// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_rt_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserRtRequestModel {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'role') String get role;@JsonKey(name: 'rt_id') String get rtId;@JsonKey(name: 'user_id') String get userId;
/// Create a copy of UserRtRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRtRequestModelCopyWith<UserRtRequestModel> get copyWith => _$UserRtRequestModelCopyWithImpl<UserRtRequestModel>(this as UserRtRequestModel, _$identity);

  /// Serializes this UserRtRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRtRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,role,rtId,userId);

@override
String toString() {
  return 'UserRtRequestModel(id: $id, role: $role, rtId: $rtId, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $UserRtRequestModelCopyWith<$Res>  {
  factory $UserRtRequestModelCopyWith(UserRtRequestModel value, $Res Function(UserRtRequestModel) _then) = _$UserRtRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'role') String role,@JsonKey(name: 'rt_id') String rtId,@JsonKey(name: 'user_id') String userId
});




}
/// @nodoc
class _$UserRtRequestModelCopyWithImpl<$Res>
    implements $UserRtRequestModelCopyWith<$Res> {
  _$UserRtRequestModelCopyWithImpl(this._self, this._then);

  final UserRtRequestModel _self;
  final $Res Function(UserRtRequestModel) _then;

/// Create a copy of UserRtRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? role = null,Object? rtId = null,Object? userId = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserRtRequestModel implements UserRtRequestModel {
  const _UserRtRequestModel({@JsonKey(name: 'id') this.id, @JsonKey(name: 'role') required this.role, @JsonKey(name: 'rt_id') required this.rtId, @JsonKey(name: 'user_id') required this.userId});
  factory _UserRtRequestModel.fromJson(Map<String, dynamic> json) => _$UserRtRequestModelFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'role') final  String role;
@override@JsonKey(name: 'rt_id') final  String rtId;
@override@JsonKey(name: 'user_id') final  String userId;

/// Create a copy of UserRtRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserRtRequestModelCopyWith<_UserRtRequestModel> get copyWith => __$UserRtRequestModelCopyWithImpl<_UserRtRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserRtRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserRtRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,role,rtId,userId);

@override
String toString() {
  return 'UserRtRequestModel(id: $id, role: $role, rtId: $rtId, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$UserRtRequestModelCopyWith<$Res> implements $UserRtRequestModelCopyWith<$Res> {
  factory _$UserRtRequestModelCopyWith(_UserRtRequestModel value, $Res Function(_UserRtRequestModel) _then) = __$UserRtRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'role') String role,@JsonKey(name: 'rt_id') String rtId,@JsonKey(name: 'user_id') String userId
});




}
/// @nodoc
class __$UserRtRequestModelCopyWithImpl<$Res>
    implements _$UserRtRequestModelCopyWith<$Res> {
  __$UserRtRequestModelCopyWithImpl(this._self, this._then);

  final _UserRtRequestModel _self;
  final $Res Function(_UserRtRequestModel) _then;

/// Create a copy of UserRtRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? role = null,Object? rtId = null,Object? userId = null,}) {
  return _then(_UserRtRequestModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
