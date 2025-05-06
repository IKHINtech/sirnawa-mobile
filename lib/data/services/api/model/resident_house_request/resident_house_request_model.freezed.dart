// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resident_house_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResidentHouseRequestModel {

 String? get id;@JsonKey(name: 'resident_id') String get residentId;@JsonKey(name: 'house_id') String get houseId;@JsonKey(name: 'is_primary') bool get isPrimary;
/// Create a copy of ResidentHouseRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResidentHouseRequestModelCopyWith<ResidentHouseRequestModel> get copyWith => _$ResidentHouseRequestModelCopyWithImpl<ResidentHouseRequestModel>(this as ResidentHouseRequestModel, _$identity);

  /// Serializes this ResidentHouseRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResidentHouseRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,residentId,houseId,isPrimary);

@override
String toString() {
  return 'ResidentHouseRequestModel(id: $id, residentId: $residentId, houseId: $houseId, isPrimary: $isPrimary)';
}


}

/// @nodoc
abstract mixin class $ResidentHouseRequestModelCopyWith<$Res>  {
  factory $ResidentHouseRequestModelCopyWith(ResidentHouseRequestModel value, $Res Function(ResidentHouseRequestModel) _then) = _$ResidentHouseRequestModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'resident_id') String residentId,@JsonKey(name: 'house_id') String houseId,@JsonKey(name: 'is_primary') bool isPrimary
});




}
/// @nodoc
class _$ResidentHouseRequestModelCopyWithImpl<$Res>
    implements $ResidentHouseRequestModelCopyWith<$Res> {
  _$ResidentHouseRequestModelCopyWithImpl(this._self, this._then);

  final ResidentHouseRequestModel _self;
  final $Res Function(ResidentHouseRequestModel) _then;

/// Create a copy of ResidentHouseRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? residentId = null,Object? houseId = null,Object? isPrimary = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,residentId: null == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ResidentHouseRequestModel implements ResidentHouseRequestModel {
  const _ResidentHouseRequestModel({this.id, @JsonKey(name: 'resident_id') required this.residentId, @JsonKey(name: 'house_id') required this.houseId, @JsonKey(name: 'is_primary') required this.isPrimary});
  factory _ResidentHouseRequestModel.fromJson(Map<String, dynamic> json) => _$ResidentHouseRequestModelFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'resident_id') final  String residentId;
@override@JsonKey(name: 'house_id') final  String houseId;
@override@JsonKey(name: 'is_primary') final  bool isPrimary;

/// Create a copy of ResidentHouseRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResidentHouseRequestModelCopyWith<_ResidentHouseRequestModel> get copyWith => __$ResidentHouseRequestModelCopyWithImpl<_ResidentHouseRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResidentHouseRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResidentHouseRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,residentId,houseId,isPrimary);

@override
String toString() {
  return 'ResidentHouseRequestModel(id: $id, residentId: $residentId, houseId: $houseId, isPrimary: $isPrimary)';
}


}

/// @nodoc
abstract mixin class _$ResidentHouseRequestModelCopyWith<$Res> implements $ResidentHouseRequestModelCopyWith<$Res> {
  factory _$ResidentHouseRequestModelCopyWith(_ResidentHouseRequestModel value, $Res Function(_ResidentHouseRequestModel) _then) = __$ResidentHouseRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'resident_id') String residentId,@JsonKey(name: 'house_id') String houseId,@JsonKey(name: 'is_primary') bool isPrimary
});




}
/// @nodoc
class __$ResidentHouseRequestModelCopyWithImpl<$Res>
    implements _$ResidentHouseRequestModelCopyWith<$Res> {
  __$ResidentHouseRequestModelCopyWithImpl(this._self, this._then);

  final _ResidentHouseRequestModel _self;
  final $Res Function(_ResidentHouseRequestModel) _then;

/// Create a copy of ResidentHouseRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? residentId = null,Object? houseId = null,Object? isPrimary = null,}) {
  return _then(_ResidentHouseRequestModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,residentId: null == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
