// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'house_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HouseModel {

 int get id;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt; String get number;@JsonKey(name: 'rw_id') String get rwId;@JsonKey(name: 'rt_id') String get rtId;@JsonKey(name: 'block_id') String get blockId; String get status;
/// Create a copy of HouseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HouseModelCopyWith<HouseModel> get copyWith => _$HouseModelCopyWithImpl<HouseModel>(this as HouseModel, _$identity);

  /// Serializes this HouseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HouseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.number, number) || other.number == number)&&(identical(other.rwId, rwId) || other.rwId == rwId)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.blockId, blockId) || other.blockId == blockId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,number,rwId,rtId,blockId,status);

@override
String toString() {
  return 'HouseModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, number: $number, rwId: $rwId, rtId: $rtId, blockId: $blockId, status: $status)';
}


}

/// @nodoc
abstract mixin class $HouseModelCopyWith<$Res>  {
  factory $HouseModelCopyWith(HouseModel value, $Res Function(HouseModel) _then) = _$HouseModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, String number,@JsonKey(name: 'rw_id') String rwId,@JsonKey(name: 'rt_id') String rtId,@JsonKey(name: 'block_id') String blockId, String status
});




}
/// @nodoc
class _$HouseModelCopyWithImpl<$Res>
    implements $HouseModelCopyWith<$Res> {
  _$HouseModelCopyWithImpl(this._self, this._then);

  final HouseModel _self;
  final $Res Function(HouseModel) _then;

/// Create a copy of HouseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? number = null,Object? rwId = null,Object? rtId = null,Object? blockId = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,rwId: null == rwId ? _self.rwId : rwId // ignore: cast_nullable_to_non_nullable
as String,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,blockId: null == blockId ? _self.blockId : blockId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _HouseModel implements HouseModel {
  const _HouseModel({required this.id, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, required this.number, @JsonKey(name: 'rw_id') required this.rwId, @JsonKey(name: 'rt_id') required this.rtId, @JsonKey(name: 'block_id') required this.blockId, required this.status});
  factory _HouseModel.fromJson(Map<String, dynamic> json) => _$HouseModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override final  String number;
@override@JsonKey(name: 'rw_id') final  String rwId;
@override@JsonKey(name: 'rt_id') final  String rtId;
@override@JsonKey(name: 'block_id') final  String blockId;
@override final  String status;

/// Create a copy of HouseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HouseModelCopyWith<_HouseModel> get copyWith => __$HouseModelCopyWithImpl<_HouseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HouseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HouseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.number, number) || other.number == number)&&(identical(other.rwId, rwId) || other.rwId == rwId)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.blockId, blockId) || other.blockId == blockId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,number,rwId,rtId,blockId,status);

@override
String toString() {
  return 'HouseModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, number: $number, rwId: $rwId, rtId: $rtId, blockId: $blockId, status: $status)';
}


}

/// @nodoc
abstract mixin class _$HouseModelCopyWith<$Res> implements $HouseModelCopyWith<$Res> {
  factory _$HouseModelCopyWith(_HouseModel value, $Res Function(_HouseModel) _then) = __$HouseModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, String number,@JsonKey(name: 'rw_id') String rwId,@JsonKey(name: 'rt_id') String rtId,@JsonKey(name: 'block_id') String blockId, String status
});




}
/// @nodoc
class __$HouseModelCopyWithImpl<$Res>
    implements _$HouseModelCopyWith<$Res> {
  __$HouseModelCopyWithImpl(this._self, this._then);

  final _HouseModel _self;
  final $Res Function(_HouseModel) _then;

/// Create a copy of HouseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? number = null,Object? rwId = null,Object? rtId = null,Object? blockId = null,Object? status = null,}) {
  return _then(_HouseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,rwId: null == rwId ? _self.rwId : rwId // ignore: cast_nullable_to_non_nullable
as String,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,blockId: null == blockId ? _self.blockId : blockId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
