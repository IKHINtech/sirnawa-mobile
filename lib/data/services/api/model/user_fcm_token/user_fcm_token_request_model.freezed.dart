// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_fcm_token_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserFcmTokenRequestModel {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'app_version') String get apVersion;@JsonKey(name: 'device_id') String get deviceId;@JsonKey(name: 'os_version') String get osVersion;@JsonKey(name: 'device_type') String get deviceType;@JsonKey(name: 'token') String get token;
/// Create a copy of UserFcmTokenRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserFcmTokenRequestModelCopyWith<UserFcmTokenRequestModel> get copyWith => _$UserFcmTokenRequestModelCopyWithImpl<UserFcmTokenRequestModel>(this as UserFcmTokenRequestModel, _$identity);

  /// Serializes this UserFcmTokenRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserFcmTokenRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.apVersion, apVersion) || other.apVersion == apVersion)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType)&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,apVersion,deviceId,osVersion,deviceType,token);

@override
String toString() {
  return 'UserFcmTokenRequestModel(id: $id, apVersion: $apVersion, deviceId: $deviceId, osVersion: $osVersion, deviceType: $deviceType, token: $token)';
}


}

/// @nodoc
abstract mixin class $UserFcmTokenRequestModelCopyWith<$Res>  {
  factory $UserFcmTokenRequestModelCopyWith(UserFcmTokenRequestModel value, $Res Function(UserFcmTokenRequestModel) _then) = _$UserFcmTokenRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'app_version') String apVersion,@JsonKey(name: 'device_id') String deviceId,@JsonKey(name: 'os_version') String osVersion,@JsonKey(name: 'device_type') String deviceType,@JsonKey(name: 'token') String token
});




}
/// @nodoc
class _$UserFcmTokenRequestModelCopyWithImpl<$Res>
    implements $UserFcmTokenRequestModelCopyWith<$Res> {
  _$UserFcmTokenRequestModelCopyWithImpl(this._self, this._then);

  final UserFcmTokenRequestModel _self;
  final $Res Function(UserFcmTokenRequestModel) _then;

/// Create a copy of UserFcmTokenRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? apVersion = null,Object? deviceId = null,Object? osVersion = null,Object? deviceType = null,Object? token = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,apVersion: null == apVersion ? _self.apVersion : apVersion // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,osVersion: null == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String,deviceType: null == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserFcmTokenRequestModel implements UserFcmTokenRequestModel {
  const _UserFcmTokenRequestModel({@JsonKey(name: 'id') this.id, @JsonKey(name: 'app_version') required this.apVersion, @JsonKey(name: 'device_id') required this.deviceId, @JsonKey(name: 'os_version') required this.osVersion, @JsonKey(name: 'device_type') required this.deviceType, @JsonKey(name: 'token') required this.token});
  factory _UserFcmTokenRequestModel.fromJson(Map<String, dynamic> json) => _$UserFcmTokenRequestModelFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'app_version') final  String apVersion;
@override@JsonKey(name: 'device_id') final  String deviceId;
@override@JsonKey(name: 'os_version') final  String osVersion;
@override@JsonKey(name: 'device_type') final  String deviceType;
@override@JsonKey(name: 'token') final  String token;

/// Create a copy of UserFcmTokenRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserFcmTokenRequestModelCopyWith<_UserFcmTokenRequestModel> get copyWith => __$UserFcmTokenRequestModelCopyWithImpl<_UserFcmTokenRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserFcmTokenRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserFcmTokenRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.apVersion, apVersion) || other.apVersion == apVersion)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType)&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,apVersion,deviceId,osVersion,deviceType,token);

@override
String toString() {
  return 'UserFcmTokenRequestModel(id: $id, apVersion: $apVersion, deviceId: $deviceId, osVersion: $osVersion, deviceType: $deviceType, token: $token)';
}


}

/// @nodoc
abstract mixin class _$UserFcmTokenRequestModelCopyWith<$Res> implements $UserFcmTokenRequestModelCopyWith<$Res> {
  factory _$UserFcmTokenRequestModelCopyWith(_UserFcmTokenRequestModel value, $Res Function(_UserFcmTokenRequestModel) _then) = __$UserFcmTokenRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'app_version') String apVersion,@JsonKey(name: 'device_id') String deviceId,@JsonKey(name: 'os_version') String osVersion,@JsonKey(name: 'device_type') String deviceType,@JsonKey(name: 'token') String token
});




}
/// @nodoc
class __$UserFcmTokenRequestModelCopyWithImpl<$Res>
    implements _$UserFcmTokenRequestModelCopyWith<$Res> {
  __$UserFcmTokenRequestModelCopyWithImpl(this._self, this._then);

  final _UserFcmTokenRequestModel _self;
  final $Res Function(_UserFcmTokenRequestModel) _then;

/// Create a copy of UserFcmTokenRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? apVersion = null,Object? deviceId = null,Object? osVersion = null,Object? deviceType = null,Object? token = null,}) {
  return _then(_UserFcmTokenRequestModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,apVersion: null == apVersion ? _self.apVersion : apVersion // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,osVersion: null == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String,deviceType: null == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
