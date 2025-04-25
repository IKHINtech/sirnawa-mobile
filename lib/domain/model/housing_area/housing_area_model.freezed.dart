// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'housing_area_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HousingAreaModel {

 String get id;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt; String get name;
/// Create a copy of HousingAreaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HousingAreaModelCopyWith<HousingAreaModel> get copyWith => _$HousingAreaModelCopyWithImpl<HousingAreaModel>(this as HousingAreaModel, _$identity);

  /// Serializes this HousingAreaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HousingAreaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,name);

@override
String toString() {
  return 'HousingAreaModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name)';
}


}

/// @nodoc
abstract mixin class $HousingAreaModelCopyWith<$Res>  {
  factory $HousingAreaModelCopyWith(HousingAreaModel value, $Res Function(HousingAreaModel) _then) = _$HousingAreaModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, String name
});




}
/// @nodoc
class _$HousingAreaModelCopyWithImpl<$Res>
    implements $HousingAreaModelCopyWith<$Res> {
  _$HousingAreaModelCopyWithImpl(this._self, this._then);

  final HousingAreaModel _self;
  final $Res Function(HousingAreaModel) _then;

/// Create a copy of HousingAreaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _HousingAreaModel implements HousingAreaModel {
  const _HousingAreaModel({required this.id, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, required this.name});
  factory _HousingAreaModel.fromJson(Map<String, dynamic> json) => _$HousingAreaModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override final  String name;

/// Create a copy of HousingAreaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HousingAreaModelCopyWith<_HousingAreaModel> get copyWith => __$HousingAreaModelCopyWithImpl<_HousingAreaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HousingAreaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HousingAreaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,name);

@override
String toString() {
  return 'HousingAreaModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name)';
}


}

/// @nodoc
abstract mixin class _$HousingAreaModelCopyWith<$Res> implements $HousingAreaModelCopyWith<$Res> {
  factory _$HousingAreaModelCopyWith(_HousingAreaModel value, $Res Function(_HousingAreaModel) _then) = __$HousingAreaModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, String name
});




}
/// @nodoc
class __$HousingAreaModelCopyWithImpl<$Res>
    implements _$HousingAreaModelCopyWith<$Res> {
  __$HousingAreaModelCopyWithImpl(this._self, this._then);

  final _HousingAreaModel _self;
  final $Res Function(_HousingAreaModel) _then;

/// Create a copy of HousingAreaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? name = null,}) {
  return _then(_HousingAreaModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
