// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ronda_group_member_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RondaGroupMemberRequestModel {

 String? get id;@JsonKey(name: 'house_id') String get houseId;@JsonKey(name: 'resident_id') String get residentId;@JsonKey(name: 'group_id') String get groupId;
/// Create a copy of RondaGroupMemberRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RondaGroupMemberRequestModelCopyWith<RondaGroupMemberRequestModel> get copyWith => _$RondaGroupMemberRequestModelCopyWithImpl<RondaGroupMemberRequestModel>(this as RondaGroupMemberRequestModel, _$identity);

  /// Serializes this RondaGroupMemberRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RondaGroupMemberRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.groupId, groupId) || other.groupId == groupId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,houseId,residentId,groupId);

@override
String toString() {
  return 'RondaGroupMemberRequestModel(id: $id, houseId: $houseId, residentId: $residentId, groupId: $groupId)';
}


}

/// @nodoc
abstract mixin class $RondaGroupMemberRequestModelCopyWith<$Res>  {
  factory $RondaGroupMemberRequestModelCopyWith(RondaGroupMemberRequestModel value, $Res Function(RondaGroupMemberRequestModel) _then) = _$RondaGroupMemberRequestModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'house_id') String houseId,@JsonKey(name: 'resident_id') String residentId,@JsonKey(name: 'group_id') String groupId
});




}
/// @nodoc
class _$RondaGroupMemberRequestModelCopyWithImpl<$Res>
    implements $RondaGroupMemberRequestModelCopyWith<$Res> {
  _$RondaGroupMemberRequestModelCopyWithImpl(this._self, this._then);

  final RondaGroupMemberRequestModel _self;
  final $Res Function(RondaGroupMemberRequestModel) _then;

/// Create a copy of RondaGroupMemberRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? houseId = null,Object? residentId = null,Object? groupId = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,residentId: null == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RondaGroupMemberRequestModel implements RondaGroupMemberRequestModel {
  const _RondaGroupMemberRequestModel({this.id, @JsonKey(name: 'house_id') required this.houseId, @JsonKey(name: 'resident_id') required this.residentId, @JsonKey(name: 'group_id') required this.groupId});
  factory _RondaGroupMemberRequestModel.fromJson(Map<String, dynamic> json) => _$RondaGroupMemberRequestModelFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'house_id') final  String houseId;
@override@JsonKey(name: 'resident_id') final  String residentId;
@override@JsonKey(name: 'group_id') final  String groupId;

/// Create a copy of RondaGroupMemberRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RondaGroupMemberRequestModelCopyWith<_RondaGroupMemberRequestModel> get copyWith => __$RondaGroupMemberRequestModelCopyWithImpl<_RondaGroupMemberRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RondaGroupMemberRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RondaGroupMemberRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.groupId, groupId) || other.groupId == groupId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,houseId,residentId,groupId);

@override
String toString() {
  return 'RondaGroupMemberRequestModel(id: $id, houseId: $houseId, residentId: $residentId, groupId: $groupId)';
}


}

/// @nodoc
abstract mixin class _$RondaGroupMemberRequestModelCopyWith<$Res> implements $RondaGroupMemberRequestModelCopyWith<$Res> {
  factory _$RondaGroupMemberRequestModelCopyWith(_RondaGroupMemberRequestModel value, $Res Function(_RondaGroupMemberRequestModel) _then) = __$RondaGroupMemberRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'house_id') String houseId,@JsonKey(name: 'resident_id') String residentId,@JsonKey(name: 'group_id') String groupId
});




}
/// @nodoc
class __$RondaGroupMemberRequestModelCopyWithImpl<$Res>
    implements _$RondaGroupMemberRequestModelCopyWith<$Res> {
  __$RondaGroupMemberRequestModelCopyWithImpl(this._self, this._then);

  final _RondaGroupMemberRequestModel _self;
  final $Res Function(_RondaGroupMemberRequestModel) _then;

/// Create a copy of RondaGroupMemberRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? houseId = null,Object? residentId = null,Object? groupId = null,}) {
  return _then(_RondaGroupMemberRequestModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,residentId: null == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
