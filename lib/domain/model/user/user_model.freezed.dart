// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

 String get id; String get email; String get role;@JsonKey(name: 'resident_id') String? get residentId; ResidentModel? get resident;@JsonKey(name: "user_rt") List<UserRtModel>? get userRTs;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.resident, resident) || other.resident == resident)&&const DeepCollectionEquality().equals(other.userRTs, userRTs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,role,residentId,resident,const DeepCollectionEquality().hash(userRTs));

@override
String toString() {
  return 'UserModel(id: $id, email: $email, role: $role, residentId: $residentId, resident: $resident, userRTs: $userRTs)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String id, String email, String role,@JsonKey(name: 'resident_id') String? residentId, ResidentModel? resident,@JsonKey(name: "user_rt") List<UserRtModel>? userRTs
});


$ResidentModelCopyWith<$Res>? get resident;

}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? role = null,Object? residentId = freezed,Object? resident = freezed,Object? userRTs = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,residentId: freezed == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String?,resident: freezed == resident ? _self.resident : resident // ignore: cast_nullable_to_non_nullable
as ResidentModel?,userRTs: freezed == userRTs ? _self.userRTs : userRTs // ignore: cast_nullable_to_non_nullable
as List<UserRtModel>?,
  ));
}
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResidentModelCopyWith<$Res>? get resident {
    if (_self.resident == null) {
    return null;
  }

  return $ResidentModelCopyWith<$Res>(_self.resident!, (value) {
    return _then(_self.copyWith(resident: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _UserModel implements UserModel {
  const _UserModel({required this.id, required this.email, required this.role, @JsonKey(name: 'resident_id') this.residentId, this.resident, @JsonKey(name: "user_rt") final  List<UserRtModel>? userRTs}): _userRTs = userRTs;
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override final  String id;
@override final  String email;
@override final  String role;
@override@JsonKey(name: 'resident_id') final  String? residentId;
@override final  ResidentModel? resident;
 final  List<UserRtModel>? _userRTs;
@override@JsonKey(name: "user_rt") List<UserRtModel>? get userRTs {
  final value = _userRTs;
  if (value == null) return null;
  if (_userRTs is EqualUnmodifiableListView) return _userRTs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.resident, resident) || other.resident == resident)&&const DeepCollectionEquality().equals(other._userRTs, _userRTs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,role,residentId,resident,const DeepCollectionEquality().hash(_userRTs));

@override
String toString() {
  return 'UserModel(id: $id, email: $email, role: $role, residentId: $residentId, resident: $resident, userRTs: $userRTs)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, String role,@JsonKey(name: 'resident_id') String? residentId, ResidentModel? resident,@JsonKey(name: "user_rt") List<UserRtModel>? userRTs
});


@override $ResidentModelCopyWith<$Res>? get resident;

}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? role = null,Object? residentId = freezed,Object? resident = freezed,Object? userRTs = freezed,}) {
  return _then(_UserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,residentId: freezed == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String?,resident: freezed == resident ? _self.resident : resident // ignore: cast_nullable_to_non_nullable
as ResidentModel?,userRTs: freezed == userRTs ? _self._userRTs : userRTs // ignore: cast_nullable_to_non_nullable
as List<UserRtModel>?,
  ));
}

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResidentModelCopyWith<$Res>? get resident {
    if (_self.resident == null) {
    return null;
  }

  return $ResidentModelCopyWith<$Res>(_self.resident!, (value) {
    return _then(_self.copyWith(resident: value));
  });
}
}

// dart format on
