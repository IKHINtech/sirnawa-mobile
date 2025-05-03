// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ronda_group_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RondaGroupRequestModel {

 String get id;@JsonKey(name: 'rt_id') String get rtId; String get name;
/// Create a copy of RondaGroupRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RondaGroupRequestModelCopyWith<RondaGroupRequestModel> get copyWith => _$RondaGroupRequestModelCopyWithImpl<RondaGroupRequestModel>(this as RondaGroupRequestModel, _$identity);

  /// Serializes this RondaGroupRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RondaGroupRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rtId,name);

@override
String toString() {
  return 'RondaGroupRequestModel(id: $id, rtId: $rtId, name: $name)';
}


}

/// @nodoc
abstract mixin class $RondaGroupRequestModelCopyWith<$Res>  {
  factory $RondaGroupRequestModelCopyWith(RondaGroupRequestModel value, $Res Function(RondaGroupRequestModel) _then) = _$RondaGroupRequestModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'rt_id') String rtId, String name
});




}
/// @nodoc
class _$RondaGroupRequestModelCopyWithImpl<$Res>
    implements $RondaGroupRequestModelCopyWith<$Res> {
  _$RondaGroupRequestModelCopyWithImpl(this._self, this._then);

  final RondaGroupRequestModel _self;
  final $Res Function(RondaGroupRequestModel) _then;

/// Create a copy of RondaGroupRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? rtId = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RondaGroupRequestModel implements RondaGroupRequestModel {
  const _RondaGroupRequestModel({required this.id, @JsonKey(name: 'rt_id') required this.rtId, required this.name});
  factory _RondaGroupRequestModel.fromJson(Map<String, dynamic> json) => _$RondaGroupRequestModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'rt_id') final  String rtId;
@override final  String name;

/// Create a copy of RondaGroupRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RondaGroupRequestModelCopyWith<_RondaGroupRequestModel> get copyWith => __$RondaGroupRequestModelCopyWithImpl<_RondaGroupRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RondaGroupRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RondaGroupRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rtId,name);

@override
String toString() {
  return 'RondaGroupRequestModel(id: $id, rtId: $rtId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$RondaGroupRequestModelCopyWith<$Res> implements $RondaGroupRequestModelCopyWith<$Res> {
  factory _$RondaGroupRequestModelCopyWith(_RondaGroupRequestModel value, $Res Function(_RondaGroupRequestModel) _then) = __$RondaGroupRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'rt_id') String rtId, String name
});




}
/// @nodoc
class __$RondaGroupRequestModelCopyWithImpl<$Res>
    implements _$RondaGroupRequestModelCopyWith<$Res> {
  __$RondaGroupRequestModelCopyWithImpl(this._self, this._then);

  final _RondaGroupRequestModel _self;
  final $Res Function(_RondaGroupRequestModel) _then;

/// Create a copy of RondaGroupRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rtId = null,Object? name = null,}) {
  return _then(_RondaGroupRequestModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
