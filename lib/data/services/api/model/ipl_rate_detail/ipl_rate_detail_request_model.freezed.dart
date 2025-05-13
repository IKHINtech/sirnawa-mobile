// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ipl_rate_detail_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IplRateDetailRequestModel {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'amount') int get amount;@JsonKey(name: 'ipl_rate_id') String? get iplRateId;@JsonKey(name: 'item_id') String get itemId;
/// Create a copy of IplRateDetailRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IplRateDetailRequestModelCopyWith<IplRateDetailRequestModel> get copyWith => _$IplRateDetailRequestModelCopyWithImpl<IplRateDetailRequestModel>(this as IplRateDetailRequestModel, _$identity);

  /// Serializes this IplRateDetailRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IplRateDetailRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.iplRateId, iplRateId) || other.iplRateId == iplRateId)&&(identical(other.itemId, itemId) || other.itemId == itemId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,iplRateId,itemId);

@override
String toString() {
  return 'IplRateDetailRequestModel(id: $id, amount: $amount, iplRateId: $iplRateId, itemId: $itemId)';
}


}

/// @nodoc
abstract mixin class $IplRateDetailRequestModelCopyWith<$Res>  {
  factory $IplRateDetailRequestModelCopyWith(IplRateDetailRequestModel value, $Res Function(IplRateDetailRequestModel) _then) = _$IplRateDetailRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'amount') int amount,@JsonKey(name: 'ipl_rate_id') String? iplRateId,@JsonKey(name: 'item_id') String itemId
});




}
/// @nodoc
class _$IplRateDetailRequestModelCopyWithImpl<$Res>
    implements $IplRateDetailRequestModelCopyWith<$Res> {
  _$IplRateDetailRequestModelCopyWithImpl(this._self, this._then);

  final IplRateDetailRequestModel _self;
  final $Res Function(IplRateDetailRequestModel) _then;

/// Create a copy of IplRateDetailRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? amount = null,Object? iplRateId = freezed,Object? itemId = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,iplRateId: freezed == iplRateId ? _self.iplRateId : iplRateId // ignore: cast_nullable_to_non_nullable
as String?,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _IplRateDetailRequestModel implements IplRateDetailRequestModel {
  const _IplRateDetailRequestModel({@JsonKey(name: 'id') this.id, @JsonKey(name: 'amount') required this.amount, @JsonKey(name: 'ipl_rate_id') this.iplRateId, @JsonKey(name: 'item_id') required this.itemId});
  factory _IplRateDetailRequestModel.fromJson(Map<String, dynamic> json) => _$IplRateDetailRequestModelFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'amount') final  int amount;
@override@JsonKey(name: 'ipl_rate_id') final  String? iplRateId;
@override@JsonKey(name: 'item_id') final  String itemId;

/// Create a copy of IplRateDetailRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IplRateDetailRequestModelCopyWith<_IplRateDetailRequestModel> get copyWith => __$IplRateDetailRequestModelCopyWithImpl<_IplRateDetailRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IplRateDetailRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IplRateDetailRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.iplRateId, iplRateId) || other.iplRateId == iplRateId)&&(identical(other.itemId, itemId) || other.itemId == itemId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,iplRateId,itemId);

@override
String toString() {
  return 'IplRateDetailRequestModel(id: $id, amount: $amount, iplRateId: $iplRateId, itemId: $itemId)';
}


}

/// @nodoc
abstract mixin class _$IplRateDetailRequestModelCopyWith<$Res> implements $IplRateDetailRequestModelCopyWith<$Res> {
  factory _$IplRateDetailRequestModelCopyWith(_IplRateDetailRequestModel value, $Res Function(_IplRateDetailRequestModel) _then) = __$IplRateDetailRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'amount') int amount,@JsonKey(name: 'ipl_rate_id') String? iplRateId,@JsonKey(name: 'item_id') String itemId
});




}
/// @nodoc
class __$IplRateDetailRequestModelCopyWithImpl<$Res>
    implements _$IplRateDetailRequestModelCopyWith<$Res> {
  __$IplRateDetailRequestModelCopyWithImpl(this._self, this._then);

  final _IplRateDetailRequestModel _self;
  final $Res Function(_IplRateDetailRequestModel) _then;

/// Create a copy of IplRateDetailRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? amount = null,Object? iplRateId = freezed,Object? itemId = null,}) {
  return _then(_IplRateDetailRequestModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,iplRateId: freezed == iplRateId ? _self.iplRateId : iplRateId // ignore: cast_nullable_to_non_nullable
as String?,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
