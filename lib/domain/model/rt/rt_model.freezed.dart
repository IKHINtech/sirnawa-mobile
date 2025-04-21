// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rt_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RtModel {

 String get id;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;@JsonKey(name: 'rw_id') String get rwId; String get name;
/// Create a copy of RtModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RtModelCopyWith<RtModel> get copyWith => _$RtModelCopyWithImpl<RtModel>(this as RtModel, _$identity);

  /// Serializes this RtModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RtModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.rwId, rwId) || other.rwId == rwId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,rwId,name);

@override
String toString() {
  return 'RtModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, rwId: $rwId, name: $name)';
}


}

/// @nodoc
abstract mixin class $RtModelCopyWith<$Res>  {
  factory $RtModelCopyWith(RtModel value, $Res Function(RtModel) _then) = _$RtModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'rw_id') String rwId, String name
});




}
/// @nodoc
class _$RtModelCopyWithImpl<$Res>
    implements $RtModelCopyWith<$Res> {
  _$RtModelCopyWithImpl(this._self, this._then);

  final RtModel _self;
  final $Res Function(RtModel) _then;

/// Create a copy of RtModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? rwId = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,rwId: null == rwId ? _self.rwId : rwId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RtModel implements RtModel {
  const _RtModel({required this.id, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'rw_id') required this.rwId, required this.name});
  factory _RtModel.fromJson(Map<String, dynamic> json) => _$RtModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override@JsonKey(name: 'rw_id') final  String rwId;
@override final  String name;

/// Create a copy of RtModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RtModelCopyWith<_RtModel> get copyWith => __$RtModelCopyWithImpl<_RtModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RtModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RtModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.rwId, rwId) || other.rwId == rwId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,rwId,name);

@override
String toString() {
  return 'RtModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, rwId: $rwId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$RtModelCopyWith<$Res> implements $RtModelCopyWith<$Res> {
  factory _$RtModelCopyWith(_RtModel value, $Res Function(_RtModel) _then) = __$RtModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'rw_id') String rwId, String name
});




}
/// @nodoc
class __$RtModelCopyWithImpl<$Res>
    implements _$RtModelCopyWith<$Res> {
  __$RtModelCopyWithImpl(this._self, this._then);

  final _RtModel _self;
  final $Res Function(_RtModel) _then;

/// Create a copy of RtModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? rwId = null,Object? name = null,}) {
  return _then(_RtModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,rwId: null == rwId ? _self.rwId : rwId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
