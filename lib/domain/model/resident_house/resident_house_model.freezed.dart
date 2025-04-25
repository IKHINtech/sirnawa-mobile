// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resident_house_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResidentHouseModel {

 String get id;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;@JsonKey(name: 'resident_id') String get residentId;@JsonKey(name: 'house_id') String get houseId;@JsonKey(name: 'is_primary') bool get isPrimary; HouseModel get house;
/// Create a copy of ResidentHouseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResidentHouseModelCopyWith<ResidentHouseModel> get copyWith => _$ResidentHouseModelCopyWithImpl<ResidentHouseModel>(this as ResidentHouseModel, _$identity);

  /// Serializes this ResidentHouseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResidentHouseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary)&&(identical(other.house, house) || other.house == house));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,residentId,houseId,isPrimary,house);

@override
String toString() {
  return 'ResidentHouseModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, residentId: $residentId, houseId: $houseId, isPrimary: $isPrimary, house: $house)';
}


}

/// @nodoc
abstract mixin class $ResidentHouseModelCopyWith<$Res>  {
  factory $ResidentHouseModelCopyWith(ResidentHouseModel value, $Res Function(ResidentHouseModel) _then) = _$ResidentHouseModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'resident_id') String residentId,@JsonKey(name: 'house_id') String houseId,@JsonKey(name: 'is_primary') bool isPrimary, HouseModel house
});


$HouseModelCopyWith<$Res> get house;

}
/// @nodoc
class _$ResidentHouseModelCopyWithImpl<$Res>
    implements $ResidentHouseModelCopyWith<$Res> {
  _$ResidentHouseModelCopyWithImpl(this._self, this._then);

  final ResidentHouseModel _self;
  final $Res Function(ResidentHouseModel) _then;

/// Create a copy of ResidentHouseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? residentId = null,Object? houseId = null,Object? isPrimary = null,Object? house = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,residentId: null == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,house: null == house ? _self.house : house // ignore: cast_nullable_to_non_nullable
as HouseModel,
  ));
}
/// Create a copy of ResidentHouseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HouseModelCopyWith<$Res> get house {
  
  return $HouseModelCopyWith<$Res>(_self.house, (value) {
    return _then(_self.copyWith(house: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ResidentHouseModel implements ResidentHouseModel {
  const _ResidentHouseModel({required this.id, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'resident_id') required this.residentId, @JsonKey(name: 'house_id') required this.houseId, @JsonKey(name: 'is_primary') required this.isPrimary, required this.house});
  factory _ResidentHouseModel.fromJson(Map<String, dynamic> json) => _$ResidentHouseModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override@JsonKey(name: 'resident_id') final  String residentId;
@override@JsonKey(name: 'house_id') final  String houseId;
@override@JsonKey(name: 'is_primary') final  bool isPrimary;
@override final  HouseModel house;

/// Create a copy of ResidentHouseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResidentHouseModelCopyWith<_ResidentHouseModel> get copyWith => __$ResidentHouseModelCopyWithImpl<_ResidentHouseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResidentHouseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResidentHouseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary)&&(identical(other.house, house) || other.house == house));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,residentId,houseId,isPrimary,house);

@override
String toString() {
  return 'ResidentHouseModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, residentId: $residentId, houseId: $houseId, isPrimary: $isPrimary, house: $house)';
}


}

/// @nodoc
abstract mixin class _$ResidentHouseModelCopyWith<$Res> implements $ResidentHouseModelCopyWith<$Res> {
  factory _$ResidentHouseModelCopyWith(_ResidentHouseModel value, $Res Function(_ResidentHouseModel) _then) = __$ResidentHouseModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'resident_id') String residentId,@JsonKey(name: 'house_id') String houseId,@JsonKey(name: 'is_primary') bool isPrimary, HouseModel house
});


@override $HouseModelCopyWith<$Res> get house;

}
/// @nodoc
class __$ResidentHouseModelCopyWithImpl<$Res>
    implements _$ResidentHouseModelCopyWith<$Res> {
  __$ResidentHouseModelCopyWithImpl(this._self, this._then);

  final _ResidentHouseModel _self;
  final $Res Function(_ResidentHouseModel) _then;

/// Create a copy of ResidentHouseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? residentId = null,Object? houseId = null,Object? isPrimary = null,Object? house = null,}) {
  return _then(_ResidentHouseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,residentId: null == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,house: null == house ? _self.house : house // ignore: cast_nullable_to_non_nullable
as HouseModel,
  ));
}

/// Create a copy of ResidentHouseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HouseModelCopyWith<$Res> get house {
  
  return $HouseModelCopyWith<$Res>(_self.house, (value) {
    return _then(_self.copyWith(house: value));
  });
}
}

// dart format on
