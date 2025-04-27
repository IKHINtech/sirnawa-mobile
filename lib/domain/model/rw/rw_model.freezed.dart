// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rw_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RwModel {

 String get id;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;@JsonKey(name: 'housing_area_id') String get housingAreaId; String get name;
/// Create a copy of RwModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RwModelCopyWith<RwModel> get copyWith => _$RwModelCopyWithImpl<RwModel>(this as RwModel, _$identity);

  /// Serializes this RwModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RwModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.housingAreaId, housingAreaId) || other.housingAreaId == housingAreaId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,housingAreaId,name);

@override
String toString() {
  return 'RwModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, housingAreaId: $housingAreaId, name: $name)';
}


}

/// @nodoc
abstract mixin class $RwModelCopyWith<$Res>  {
  factory $RwModelCopyWith(RwModel value, $Res Function(RwModel) _then) = _$RwModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'housing_area_id') String housingAreaId, String name
});




}
/// @nodoc
class _$RwModelCopyWithImpl<$Res>
    implements $RwModelCopyWith<$Res> {
  _$RwModelCopyWithImpl(this._self, this._then);

  final RwModel _self;
  final $Res Function(RwModel) _then;

/// Create a copy of RwModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? housingAreaId = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,housingAreaId: null == housingAreaId ? _self.housingAreaId : housingAreaId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RwModel implements RwModel {
  const _RwModel({required this.id, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'housing_area_id') required this.housingAreaId, required this.name});
  factory _RwModel.fromJson(Map<String, dynamic> json) => _$RwModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override@JsonKey(name: 'housing_area_id') final  String housingAreaId;
@override final  String name;

/// Create a copy of RwModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RwModelCopyWith<_RwModel> get copyWith => __$RwModelCopyWithImpl<_RwModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RwModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RwModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.housingAreaId, housingAreaId) || other.housingAreaId == housingAreaId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,housingAreaId,name);

@override
String toString() {
  return 'RwModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, housingAreaId: $housingAreaId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$RwModelCopyWith<$Res> implements $RwModelCopyWith<$Res> {
  factory _$RwModelCopyWith(_RwModel value, $Res Function(_RwModel) _then) = __$RwModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'housing_area_id') String housingAreaId, String name
});




}
/// @nodoc
class __$RwModelCopyWithImpl<$Res>
    implements _$RwModelCopyWith<$Res> {
  __$RwModelCopyWithImpl(this._self, this._then);

  final _RwModel _self;
  final $Res Function(_RwModel) _then;

/// Create a copy of RwModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? housingAreaId = null,Object? name = null,}) {
  return _then(_RwModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,housingAreaId: null == housingAreaId ? _self.housingAreaId : housingAreaId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
