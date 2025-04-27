// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'house_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HouseRequestModel {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'number') String get number;@JsonKey(name: 'status') String get status;@JsonKey(name: 'rt_id') String get rtId;@JsonKey(name: 'block_id') String get blockId;
/// Create a copy of HouseRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HouseRequestModelCopyWith<HouseRequestModel> get copyWith => _$HouseRequestModelCopyWithImpl<HouseRequestModel>(this as HouseRequestModel, _$identity);

  /// Serializes this HouseRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HouseRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.number, number) || other.number == number)&&(identical(other.status, status) || other.status == status)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.blockId, blockId) || other.blockId == blockId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,number,status,rtId,blockId);

@override
String toString() {
  return 'HouseRequestModel(id: $id, number: $number, status: $status, rtId: $rtId, blockId: $blockId)';
}


}

/// @nodoc
abstract mixin class $HouseRequestModelCopyWith<$Res>  {
  factory $HouseRequestModelCopyWith(HouseRequestModel value, $Res Function(HouseRequestModel) _then) = _$HouseRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'number') String number,@JsonKey(name: 'status') String status,@JsonKey(name: 'rt_id') String rtId,@JsonKey(name: 'block_id') String blockId
});




}
/// @nodoc
class _$HouseRequestModelCopyWithImpl<$Res>
    implements $HouseRequestModelCopyWith<$Res> {
  _$HouseRequestModelCopyWithImpl(this._self, this._then);

  final HouseRequestModel _self;
  final $Res Function(HouseRequestModel) _then;

/// Create a copy of HouseRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? number = null,Object? status = null,Object? rtId = null,Object? blockId = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,blockId: null == blockId ? _self.blockId : blockId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _HouseRequestModel implements HouseRequestModel {
  const _HouseRequestModel({@JsonKey(name: 'id') this.id, @JsonKey(name: 'number') required this.number, @JsonKey(name: 'status') required this.status, @JsonKey(name: 'rt_id') required this.rtId, @JsonKey(name: 'block_id') required this.blockId});
  factory _HouseRequestModel.fromJson(Map<String, dynamic> json) => _$HouseRequestModelFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'number') final  String number;
@override@JsonKey(name: 'status') final  String status;
@override@JsonKey(name: 'rt_id') final  String rtId;
@override@JsonKey(name: 'block_id') final  String blockId;

/// Create a copy of HouseRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HouseRequestModelCopyWith<_HouseRequestModel> get copyWith => __$HouseRequestModelCopyWithImpl<_HouseRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HouseRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HouseRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.number, number) || other.number == number)&&(identical(other.status, status) || other.status == status)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.blockId, blockId) || other.blockId == blockId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,number,status,rtId,blockId);

@override
String toString() {
  return 'HouseRequestModel(id: $id, number: $number, status: $status, rtId: $rtId, blockId: $blockId)';
}


}

/// @nodoc
abstract mixin class _$HouseRequestModelCopyWith<$Res> implements $HouseRequestModelCopyWith<$Res> {
  factory _$HouseRequestModelCopyWith(_HouseRequestModel value, $Res Function(_HouseRequestModel) _then) = __$HouseRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'number') String number,@JsonKey(name: 'status') String status,@JsonKey(name: 'rt_id') String rtId,@JsonKey(name: 'block_id') String blockId
});




}
/// @nodoc
class __$HouseRequestModelCopyWithImpl<$Res>
    implements _$HouseRequestModelCopyWith<$Res> {
  __$HouseRequestModelCopyWithImpl(this._self, this._then);

  final _HouseRequestModel _self;
  final $Res Function(_HouseRequestModel) _then;

/// Create a copy of HouseRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? number = null,Object? status = null,Object? rtId = null,Object? blockId = null,}) {
  return _then(_HouseRequestModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,blockId: null == blockId ? _self.blockId : blockId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
