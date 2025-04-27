// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rw_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RwRequestModel {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'housing_area_id') String get housingAreaId;
/// Create a copy of RwRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RwRequestModelCopyWith<RwRequestModel> get copyWith => _$RwRequestModelCopyWithImpl<RwRequestModel>(this as RwRequestModel, _$identity);

  /// Serializes this RwRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RwRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.housingAreaId, housingAreaId) || other.housingAreaId == housingAreaId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,housingAreaId);

@override
String toString() {
  return 'RwRequestModel(id: $id, name: $name, housingAreaId: $housingAreaId)';
}


}

/// @nodoc
abstract mixin class $RwRequestModelCopyWith<$Res>  {
  factory $RwRequestModelCopyWith(RwRequestModel value, $Res Function(RwRequestModel) _then) = _$RwRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'name') String name,@JsonKey(name: 'housing_area_id') String housingAreaId
});




}
/// @nodoc
class _$RwRequestModelCopyWithImpl<$Res>
    implements $RwRequestModelCopyWith<$Res> {
  _$RwRequestModelCopyWithImpl(this._self, this._then);

  final RwRequestModel _self;
  final $Res Function(RwRequestModel) _then;

/// Create a copy of RwRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? housingAreaId = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,housingAreaId: null == housingAreaId ? _self.housingAreaId : housingAreaId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RwRequestModel implements RwRequestModel {
  const _RwRequestModel({@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'housing_area_id') required this.housingAreaId});
  factory _RwRequestModel.fromJson(Map<String, dynamic> json) => _$RwRequestModelFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'housing_area_id') final  String housingAreaId;

/// Create a copy of RwRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RwRequestModelCopyWith<_RwRequestModel> get copyWith => __$RwRequestModelCopyWithImpl<_RwRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RwRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RwRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.housingAreaId, housingAreaId) || other.housingAreaId == housingAreaId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,housingAreaId);

@override
String toString() {
  return 'RwRequestModel(id: $id, name: $name, housingAreaId: $housingAreaId)';
}


}

/// @nodoc
abstract mixin class _$RwRequestModelCopyWith<$Res> implements $RwRequestModelCopyWith<$Res> {
  factory _$RwRequestModelCopyWith(_RwRequestModel value, $Res Function(_RwRequestModel) _then) = __$RwRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'name') String name,@JsonKey(name: 'housing_area_id') String housingAreaId
});




}
/// @nodoc
class __$RwRequestModelCopyWithImpl<$Res>
    implements _$RwRequestModelCopyWith<$Res> {
  __$RwRequestModelCopyWithImpl(this._self, this._then);

  final _RwRequestModel _self;
  final $Res Function(_RwRequestModel) _then;

/// Create a copy of RwRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? housingAreaId = null,}) {
  return _then(_RwRequestModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,housingAreaId: null == housingAreaId ? _self.housingAreaId : housingAreaId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
