// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'housing_area_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HousingAreaRequestModel {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'name') String get name;
/// Create a copy of HousingAreaRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HousingAreaRequestModelCopyWith<HousingAreaRequestModel> get copyWith => _$HousingAreaRequestModelCopyWithImpl<HousingAreaRequestModel>(this as HousingAreaRequestModel, _$identity);

  /// Serializes this HousingAreaRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HousingAreaRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'HousingAreaRequestModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $HousingAreaRequestModelCopyWith<$Res>  {
  factory $HousingAreaRequestModelCopyWith(HousingAreaRequestModel value, $Res Function(HousingAreaRequestModel) _then) = _$HousingAreaRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'name') String name
});




}
/// @nodoc
class _$HousingAreaRequestModelCopyWithImpl<$Res>
    implements $HousingAreaRequestModelCopyWith<$Res> {
  _$HousingAreaRequestModelCopyWithImpl(this._self, this._then);

  final HousingAreaRequestModel _self;
  final $Res Function(HousingAreaRequestModel) _then;

/// Create a copy of HousingAreaRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _HousingAreaRequestModel implements HousingAreaRequestModel {
  const _HousingAreaRequestModel({@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') required this.name});
  factory _HousingAreaRequestModel.fromJson(Map<String, dynamic> json) => _$HousingAreaRequestModelFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'name') final  String name;

/// Create a copy of HousingAreaRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HousingAreaRequestModelCopyWith<_HousingAreaRequestModel> get copyWith => __$HousingAreaRequestModelCopyWithImpl<_HousingAreaRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HousingAreaRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HousingAreaRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'HousingAreaRequestModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$HousingAreaRequestModelCopyWith<$Res> implements $HousingAreaRequestModelCopyWith<$Res> {
  factory _$HousingAreaRequestModelCopyWith(_HousingAreaRequestModel value, $Res Function(_HousingAreaRequestModel) _then) = __$HousingAreaRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'name') String name
});




}
/// @nodoc
class __$HousingAreaRequestModelCopyWithImpl<$Res>
    implements _$HousingAreaRequestModelCopyWith<$Res> {
  __$HousingAreaRequestModelCopyWithImpl(this._self, this._then);

  final _HousingAreaRequestModel _self;
  final $Res Function(_HousingAreaRequestModel) _then;

/// Create a copy of HousingAreaRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,}) {
  return _then(_HousingAreaRequestModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
