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

 String get id;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt; String get number;@JsonKey(name: 'rw_id') String get rwId;@JsonKey(name: 'rt_id') String get rtId;@JsonKey(name: 'block_id') String get blockId; String get status; RwModel? get rw; RtModel? get rt; BlockModel? get block;@JsonKey(name: 'housing_area') HousingAreaModel? get hosuingArea;@JsonKey(name: 'resident_houses') List<ResidentHouseModel>? get residentHouses;
/// Create a copy of HouseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HouseModelCopyWith<HouseModel> get copyWith => _$HouseModelCopyWithImpl<HouseModel>(this as HouseModel, _$identity);

  /// Serializes this HouseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HouseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.number, number) || other.number == number)&&(identical(other.rwId, rwId) || other.rwId == rwId)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.blockId, blockId) || other.blockId == blockId)&&(identical(other.status, status) || other.status == status)&&(identical(other.rw, rw) || other.rw == rw)&&(identical(other.rt, rt) || other.rt == rt)&&(identical(other.block, block) || other.block == block)&&(identical(other.hosuingArea, hosuingArea) || other.hosuingArea == hosuingArea)&&const DeepCollectionEquality().equals(other.residentHouses, residentHouses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,number,rwId,rtId,blockId,status,rw,rt,block,hosuingArea,const DeepCollectionEquality().hash(residentHouses));

@override
String toString() {
  return 'HouseModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, number: $number, rwId: $rwId, rtId: $rtId, blockId: $blockId, status: $status, rw: $rw, rt: $rt, block: $block, hosuingArea: $hosuingArea, residentHouses: $residentHouses)';
}


}

/// @nodoc
abstract mixin class $HouseModelCopyWith<$Res>  {
  factory $HouseModelCopyWith(HouseModel value, $Res Function(HouseModel) _then) = _$HouseModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, String number,@JsonKey(name: 'rw_id') String rwId,@JsonKey(name: 'rt_id') String rtId,@JsonKey(name: 'block_id') String blockId, String status, RwModel? rw, RtModel? rt, BlockModel? block,@JsonKey(name: 'housing_area') HousingAreaModel? hosuingArea,@JsonKey(name: 'resident_houses') List<ResidentHouseModel>? residentHouses
});


$RwModelCopyWith<$Res>? get rw;$RtModelCopyWith<$Res>? get rt;$BlockModelCopyWith<$Res>? get block;$HousingAreaModelCopyWith<$Res>? get hosuingArea;

}
/// @nodoc
class _$HouseModelCopyWithImpl<$Res>
    implements $HouseModelCopyWith<$Res> {
  _$HouseModelCopyWithImpl(this._self, this._then);

  final HouseModel _self;
  final $Res Function(HouseModel) _then;

/// Create a copy of HouseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? number = null,Object? rwId = null,Object? rtId = null,Object? blockId = null,Object? status = null,Object? rw = freezed,Object? rt = freezed,Object? block = freezed,Object? hosuingArea = freezed,Object? residentHouses = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,rwId: null == rwId ? _self.rwId : rwId // ignore: cast_nullable_to_non_nullable
as String,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,blockId: null == blockId ? _self.blockId : blockId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,rw: freezed == rw ? _self.rw : rw // ignore: cast_nullable_to_non_nullable
as RwModel?,rt: freezed == rt ? _self.rt : rt // ignore: cast_nullable_to_non_nullable
as RtModel?,block: freezed == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as BlockModel?,hosuingArea: freezed == hosuingArea ? _self.hosuingArea : hosuingArea // ignore: cast_nullable_to_non_nullable
as HousingAreaModel?,residentHouses: freezed == residentHouses ? _self.residentHouses : residentHouses // ignore: cast_nullable_to_non_nullable
as List<ResidentHouseModel>?,
  ));
}
/// Create a copy of HouseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RwModelCopyWith<$Res>? get rw {
    if (_self.rw == null) {
    return null;
  }

  return $RwModelCopyWith<$Res>(_self.rw!, (value) {
    return _then(_self.copyWith(rw: value));
  });
}/// Create a copy of HouseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RtModelCopyWith<$Res>? get rt {
    if (_self.rt == null) {
    return null;
  }

  return $RtModelCopyWith<$Res>(_self.rt!, (value) {
    return _then(_self.copyWith(rt: value));
  });
}/// Create a copy of HouseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlockModelCopyWith<$Res>? get block {
    if (_self.block == null) {
    return null;
  }

  return $BlockModelCopyWith<$Res>(_self.block!, (value) {
    return _then(_self.copyWith(block: value));
  });
}/// Create a copy of HouseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HousingAreaModelCopyWith<$Res>? get hosuingArea {
    if (_self.hosuingArea == null) {
    return null;
  }

  return $HousingAreaModelCopyWith<$Res>(_self.hosuingArea!, (value) {
    return _then(_self.copyWith(hosuingArea: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _HouseModel implements HouseModel {
  const _HouseModel({required this.id, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, required this.number, @JsonKey(name: 'rw_id') required this.rwId, @JsonKey(name: 'rt_id') required this.rtId, @JsonKey(name: 'block_id') required this.blockId, required this.status, this.rw, this.rt, this.block, @JsonKey(name: 'housing_area') this.hosuingArea, @JsonKey(name: 'resident_houses') final  List<ResidentHouseModel>? residentHouses}): _residentHouses = residentHouses;
  factory _HouseModel.fromJson(Map<String, dynamic> json) => _$HouseModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override final  String number;
@override@JsonKey(name: 'rw_id') final  String rwId;
@override@JsonKey(name: 'rt_id') final  String rtId;
@override@JsonKey(name: 'block_id') final  String blockId;
@override final  String status;
@override final  RwModel? rw;
@override final  RtModel? rt;
@override final  BlockModel? block;
@override@JsonKey(name: 'housing_area') final  HousingAreaModel? hosuingArea;
 final  List<ResidentHouseModel>? _residentHouses;
@override@JsonKey(name: 'resident_houses') List<ResidentHouseModel>? get residentHouses {
  final value = _residentHouses;
  if (value == null) return null;
  if (_residentHouses is EqualUnmodifiableListView) return _residentHouses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HouseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.number, number) || other.number == number)&&(identical(other.rwId, rwId) || other.rwId == rwId)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.blockId, blockId) || other.blockId == blockId)&&(identical(other.status, status) || other.status == status)&&(identical(other.rw, rw) || other.rw == rw)&&(identical(other.rt, rt) || other.rt == rt)&&(identical(other.block, block) || other.block == block)&&(identical(other.hosuingArea, hosuingArea) || other.hosuingArea == hosuingArea)&&const DeepCollectionEquality().equals(other._residentHouses, _residentHouses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,number,rwId,rtId,blockId,status,rw,rt,block,hosuingArea,const DeepCollectionEquality().hash(_residentHouses));

@override
String toString() {
  return 'HouseModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, number: $number, rwId: $rwId, rtId: $rtId, blockId: $blockId, status: $status, rw: $rw, rt: $rt, block: $block, hosuingArea: $hosuingArea, residentHouses: $residentHouses)';
}


}

/// @nodoc
abstract mixin class _$HouseModelCopyWith<$Res> implements $HouseModelCopyWith<$Res> {
  factory _$HouseModelCopyWith(_HouseModel value, $Res Function(_HouseModel) _then) = __$HouseModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, String number,@JsonKey(name: 'rw_id') String rwId,@JsonKey(name: 'rt_id') String rtId,@JsonKey(name: 'block_id') String blockId, String status, RwModel? rw, RtModel? rt, BlockModel? block,@JsonKey(name: 'housing_area') HousingAreaModel? hosuingArea,@JsonKey(name: 'resident_houses') List<ResidentHouseModel>? residentHouses
});


@override $RwModelCopyWith<$Res>? get rw;@override $RtModelCopyWith<$Res>? get rt;@override $BlockModelCopyWith<$Res>? get block;@override $HousingAreaModelCopyWith<$Res>? get hosuingArea;

}
/// @nodoc
class __$HouseModelCopyWithImpl<$Res>
    implements _$HouseModelCopyWith<$Res> {
  __$HouseModelCopyWithImpl(this._self, this._then);

  final _HouseModel _self;
  final $Res Function(_HouseModel) _then;

/// Create a copy of HouseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? number = null,Object? rwId = null,Object? rtId = null,Object? blockId = null,Object? status = null,Object? rw = freezed,Object? rt = freezed,Object? block = freezed,Object? hosuingArea = freezed,Object? residentHouses = freezed,}) {
  return _then(_HouseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,rwId: null == rwId ? _self.rwId : rwId // ignore: cast_nullable_to_non_nullable
as String,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,blockId: null == blockId ? _self.blockId : blockId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,rw: freezed == rw ? _self.rw : rw // ignore: cast_nullable_to_non_nullable
as RwModel?,rt: freezed == rt ? _self.rt : rt // ignore: cast_nullable_to_non_nullable
as RtModel?,block: freezed == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as BlockModel?,hosuingArea: freezed == hosuingArea ? _self.hosuingArea : hosuingArea // ignore: cast_nullable_to_non_nullable
as HousingAreaModel?,residentHouses: freezed == residentHouses ? _self._residentHouses : residentHouses // ignore: cast_nullable_to_non_nullable
as List<ResidentHouseModel>?,
  ));
}

/// Create a copy of HouseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RwModelCopyWith<$Res>? get rw {
    if (_self.rw == null) {
    return null;
  }

  return $RwModelCopyWith<$Res>(_self.rw!, (value) {
    return _then(_self.copyWith(rw: value));
  });
}/// Create a copy of HouseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RtModelCopyWith<$Res>? get rt {
    if (_self.rt == null) {
    return null;
  }

  return $RtModelCopyWith<$Res>(_self.rt!, (value) {
    return _then(_self.copyWith(rt: value));
  });
}/// Create a copy of HouseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlockModelCopyWith<$Res>? get block {
    if (_self.block == null) {
    return null;
  }

  return $BlockModelCopyWith<$Res>(_self.block!, (value) {
    return _then(_self.copyWith(block: value));
  });
}/// Create a copy of HouseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HousingAreaModelCopyWith<$Res>? get hosuingArea {
    if (_self.hosuingArea == null) {
    return null;
  }

  return $HousingAreaModelCopyWith<$Res>(_self.hosuingArea!, (value) {
    return _then(_self.copyWith(hosuingArea: value));
  });
}
}

// dart format on
