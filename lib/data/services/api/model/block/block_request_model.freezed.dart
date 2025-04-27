// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'block_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BlockRequestModel {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'rt_id') String get rtId;
/// Create a copy of BlockRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlockRequestModelCopyWith<BlockRequestModel> get copyWith => _$BlockRequestModelCopyWithImpl<BlockRequestModel>(this as BlockRequestModel, _$identity);

  /// Serializes this BlockRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlockRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.rtId, rtId) || other.rtId == rtId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,rtId);

@override
String toString() {
  return 'BlockRequestModel(id: $id, name: $name, rtId: $rtId)';
}


}

/// @nodoc
abstract mixin class $BlockRequestModelCopyWith<$Res>  {
  factory $BlockRequestModelCopyWith(BlockRequestModel value, $Res Function(BlockRequestModel) _then) = _$BlockRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'name') String name,@JsonKey(name: 'rt_id') String rtId
});




}
/// @nodoc
class _$BlockRequestModelCopyWithImpl<$Res>
    implements $BlockRequestModelCopyWith<$Res> {
  _$BlockRequestModelCopyWithImpl(this._self, this._then);

  final BlockRequestModel _self;
  final $Res Function(BlockRequestModel) _then;

/// Create a copy of BlockRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? rtId = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BlockRequestModel implements BlockRequestModel {
  const _BlockRequestModel({@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'rt_id') required this.rtId});
  factory _BlockRequestModel.fromJson(Map<String, dynamic> json) => _$BlockRequestModelFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'rt_id') final  String rtId;

/// Create a copy of BlockRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlockRequestModelCopyWith<_BlockRequestModel> get copyWith => __$BlockRequestModelCopyWithImpl<_BlockRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BlockRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlockRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.rtId, rtId) || other.rtId == rtId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,rtId);

@override
String toString() {
  return 'BlockRequestModel(id: $id, name: $name, rtId: $rtId)';
}


}

/// @nodoc
abstract mixin class _$BlockRequestModelCopyWith<$Res> implements $BlockRequestModelCopyWith<$Res> {
  factory _$BlockRequestModelCopyWith(_BlockRequestModel value, $Res Function(_BlockRequestModel) _then) = __$BlockRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'name') String name,@JsonKey(name: 'rt_id') String rtId
});




}
/// @nodoc
class __$BlockRequestModelCopyWithImpl<$Res>
    implements _$BlockRequestModelCopyWith<$Res> {
  __$BlockRequestModelCopyWithImpl(this._self, this._then);

  final _BlockRequestModel _self;
  final $Res Function(_BlockRequestModel) _then;

/// Create a copy of BlockRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? rtId = null,}) {
  return _then(_BlockRequestModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
