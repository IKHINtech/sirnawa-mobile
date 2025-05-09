// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ronda_group_member_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RondaGroupMemberModel {

 String get id;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;@JsonKey(name: 'house_id') String get houseId;@JsonKey(name: 'resident_id') String get residentId;@JsonKey(name: 'group_id') String get rondaGroupId;@JsonKey(name: 'house') HouseModel? get house;@JsonKey(name: 'resident') ResidentModel? get resident;
/// Create a copy of RondaGroupMemberModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RondaGroupMemberModelCopyWith<RondaGroupMemberModel> get copyWith => _$RondaGroupMemberModelCopyWithImpl<RondaGroupMemberModel>(this as RondaGroupMemberModel, _$identity);

  /// Serializes this RondaGroupMemberModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RondaGroupMemberModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.rondaGroupId, rondaGroupId) || other.rondaGroupId == rondaGroupId)&&(identical(other.house, house) || other.house == house)&&(identical(other.resident, resident) || other.resident == resident));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,houseId,residentId,rondaGroupId,house,resident);

@override
String toString() {
  return 'RondaGroupMemberModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, houseId: $houseId, residentId: $residentId, rondaGroupId: $rondaGroupId, house: $house, resident: $resident)';
}


}

/// @nodoc
abstract mixin class $RondaGroupMemberModelCopyWith<$Res>  {
  factory $RondaGroupMemberModelCopyWith(RondaGroupMemberModel value, $Res Function(RondaGroupMemberModel) _then) = _$RondaGroupMemberModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'house_id') String houseId,@JsonKey(name: 'resident_id') String residentId,@JsonKey(name: 'group_id') String rondaGroupId,@JsonKey(name: 'house') HouseModel? house,@JsonKey(name: 'resident') ResidentModel? resident
});


$HouseModelCopyWith<$Res>? get house;$ResidentModelCopyWith<$Res>? get resident;

}
/// @nodoc
class _$RondaGroupMemberModelCopyWithImpl<$Res>
    implements $RondaGroupMemberModelCopyWith<$Res> {
  _$RondaGroupMemberModelCopyWithImpl(this._self, this._then);

  final RondaGroupMemberModel _self;
  final $Res Function(RondaGroupMemberModel) _then;

/// Create a copy of RondaGroupMemberModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? houseId = null,Object? residentId = null,Object? rondaGroupId = null,Object? house = freezed,Object? resident = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,residentId: null == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String,rondaGroupId: null == rondaGroupId ? _self.rondaGroupId : rondaGroupId // ignore: cast_nullable_to_non_nullable
as String,house: freezed == house ? _self.house : house // ignore: cast_nullable_to_non_nullable
as HouseModel?,resident: freezed == resident ? _self.resident : resident // ignore: cast_nullable_to_non_nullable
as ResidentModel?,
  ));
}
/// Create a copy of RondaGroupMemberModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HouseModelCopyWith<$Res>? get house {
    if (_self.house == null) {
    return null;
  }

  return $HouseModelCopyWith<$Res>(_self.house!, (value) {
    return _then(_self.copyWith(house: value));
  });
}/// Create a copy of RondaGroupMemberModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResidentModelCopyWith<$Res>? get resident {
    if (_self.resident == null) {
    return null;
  }

  return $ResidentModelCopyWith<$Res>(_self.resident!, (value) {
    return _then(_self.copyWith(resident: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _RondaGroupMemberModel implements RondaGroupMemberModel {
  const _RondaGroupMemberModel({required this.id, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'house_id') required this.houseId, @JsonKey(name: 'resident_id') required this.residentId, @JsonKey(name: 'group_id') required this.rondaGroupId, @JsonKey(name: 'house') this.house, @JsonKey(name: 'resident') this.resident});
  factory _RondaGroupMemberModel.fromJson(Map<String, dynamic> json) => _$RondaGroupMemberModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override@JsonKey(name: 'house_id') final  String houseId;
@override@JsonKey(name: 'resident_id') final  String residentId;
@override@JsonKey(name: 'group_id') final  String rondaGroupId;
@override@JsonKey(name: 'house') final  HouseModel? house;
@override@JsonKey(name: 'resident') final  ResidentModel? resident;

/// Create a copy of RondaGroupMemberModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RondaGroupMemberModelCopyWith<_RondaGroupMemberModel> get copyWith => __$RondaGroupMemberModelCopyWithImpl<_RondaGroupMemberModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RondaGroupMemberModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RondaGroupMemberModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.rondaGroupId, rondaGroupId) || other.rondaGroupId == rondaGroupId)&&(identical(other.house, house) || other.house == house)&&(identical(other.resident, resident) || other.resident == resident));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,houseId,residentId,rondaGroupId,house,resident);

@override
String toString() {
  return 'RondaGroupMemberModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, houseId: $houseId, residentId: $residentId, rondaGroupId: $rondaGroupId, house: $house, resident: $resident)';
}


}

/// @nodoc
abstract mixin class _$RondaGroupMemberModelCopyWith<$Res> implements $RondaGroupMemberModelCopyWith<$Res> {
  factory _$RondaGroupMemberModelCopyWith(_RondaGroupMemberModel value, $Res Function(_RondaGroupMemberModel) _then) = __$RondaGroupMemberModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'house_id') String houseId,@JsonKey(name: 'resident_id') String residentId,@JsonKey(name: 'group_id') String rondaGroupId,@JsonKey(name: 'house') HouseModel? house,@JsonKey(name: 'resident') ResidentModel? resident
});


@override $HouseModelCopyWith<$Res>? get house;@override $ResidentModelCopyWith<$Res>? get resident;

}
/// @nodoc
class __$RondaGroupMemberModelCopyWithImpl<$Res>
    implements _$RondaGroupMemberModelCopyWith<$Res> {
  __$RondaGroupMemberModelCopyWithImpl(this._self, this._then);

  final _RondaGroupMemberModel _self;
  final $Res Function(_RondaGroupMemberModel) _then;

/// Create a copy of RondaGroupMemberModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? houseId = null,Object? residentId = null,Object? rondaGroupId = null,Object? house = freezed,Object? resident = freezed,}) {
  return _then(_RondaGroupMemberModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,residentId: null == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String,rondaGroupId: null == rondaGroupId ? _self.rondaGroupId : rondaGroupId // ignore: cast_nullable_to_non_nullable
as String,house: freezed == house ? _self.house : house // ignore: cast_nullable_to_non_nullable
as HouseModel?,resident: freezed == resident ? _self.resident : resident // ignore: cast_nullable_to_non_nullable
as ResidentModel?,
  ));
}

/// Create a copy of RondaGroupMemberModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HouseModelCopyWith<$Res>? get house {
    if (_self.house == null) {
    return null;
  }

  return $HouseModelCopyWith<$Res>(_self.house!, (value) {
    return _then(_self.copyWith(house: value));
  });
}/// Create a copy of RondaGroupMemberModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResidentModelCopyWith<$Res>? get resident {
    if (_self.resident == null) {
    return null;
  }

  return $ResidentModelCopyWith<$Res>(_self.resident!, (value) {
    return _then(_self.copyWith(resident: value));
  });
}
}

// dart format on
