// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'access_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccessToken {

// Token data
 String get token;// token expiresIn
@JsonKey(name: 'expires_in') int get expiresIn;
/// Create a copy of AccessToken
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccessTokenCopyWith<AccessToken> get copyWith => _$AccessTokenCopyWithImpl<AccessToken>(this as AccessToken, _$identity);

  /// Serializes this AccessToken to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccessToken&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,expiresIn);

@override
String toString() {
  return 'AccessToken(token: $token, expiresIn: $expiresIn)';
}


}

/// @nodoc
abstract mixin class $AccessTokenCopyWith<$Res>  {
  factory $AccessTokenCopyWith(AccessToken value, $Res Function(AccessToken) _then) = _$AccessTokenCopyWithImpl;
@useResult
$Res call({
 String token,@JsonKey(name: 'expires_in') int expiresIn
});




}
/// @nodoc
class _$AccessTokenCopyWithImpl<$Res>
    implements $AccessTokenCopyWith<$Res> {
  _$AccessTokenCopyWithImpl(this._self, this._then);

  final AccessToken _self;
  final $Res Function(AccessToken) _then;

/// Create a copy of AccessToken
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? expiresIn = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AccessToken implements AccessToken {
  const _AccessToken({required this.token, @JsonKey(name: 'expires_in') required this.expiresIn});
  factory _AccessToken.fromJson(Map<String, dynamic> json) => _$AccessTokenFromJson(json);

// Token data
@override final  String token;
// token expiresIn
@override@JsonKey(name: 'expires_in') final  int expiresIn;

/// Create a copy of AccessToken
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccessTokenCopyWith<_AccessToken> get copyWith => __$AccessTokenCopyWithImpl<_AccessToken>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccessTokenToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccessToken&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,expiresIn);

@override
String toString() {
  return 'AccessToken(token: $token, expiresIn: $expiresIn)';
}


}

/// @nodoc
abstract mixin class _$AccessTokenCopyWith<$Res> implements $AccessTokenCopyWith<$Res> {
  factory _$AccessTokenCopyWith(_AccessToken value, $Res Function(_AccessToken) _then) = __$AccessTokenCopyWithImpl;
@override @useResult
$Res call({
 String token,@JsonKey(name: 'expires_in') int expiresIn
});




}
/// @nodoc
class __$AccessTokenCopyWithImpl<$Res>
    implements _$AccessTokenCopyWith<$Res> {
  __$AccessTokenCopyWithImpl(this._self, this._then);

  final _AccessToken _self;
  final $Res Function(_AccessToken) _then;

/// Create a copy of AccessToken
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? expiresIn = null,}) {
  return _then(_AccessToken(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
