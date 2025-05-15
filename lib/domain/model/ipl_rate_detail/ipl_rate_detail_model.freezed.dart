// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ipl_rate_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IplRateDetailModel {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'amount') int get amount;@JsonKey(name: 'ipl_rate_id') String? get iplRateId;@JsonKey(name: 'item_id') String get itemId;
/// Create a copy of IplRateDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IplRateDetailModelCopyWith<IplRateDetailModel> get copyWith => _$IplRateDetailModelCopyWithImpl<IplRateDetailModel>(this as IplRateDetailModel, _$identity);

  /// Serializes this IplRateDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IplRateDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.iplRateId, iplRateId) || other.iplRateId == iplRateId)&&(identical(other.itemId, itemId) || other.itemId == itemId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,iplRateId,itemId);

@override
String toString() {
  return 'IplRateDetailModel(id: $id, amount: $amount, iplRateId: $iplRateId, itemId: $itemId)';
}


}

/// @nodoc
abstract mixin class $IplRateDetailModelCopyWith<$Res>  {
  factory $IplRateDetailModelCopyWith(IplRateDetailModel value, $Res Function(IplRateDetailModel) _then) = _$IplRateDetailModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'amount') int amount,@JsonKey(name: 'ipl_rate_id') String? iplRateId,@JsonKey(name: 'item_id') String itemId
});




}
/// @nodoc
class _$IplRateDetailModelCopyWithImpl<$Res>
    implements $IplRateDetailModelCopyWith<$Res> {
  _$IplRateDetailModelCopyWithImpl(this._self, this._then);

  final IplRateDetailModel _self;
  final $Res Function(IplRateDetailModel) _then;

/// Create a copy of IplRateDetailModel
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

class _IplRateDetailModel implements IplRateDetailModel {
  const _IplRateDetailModel({@JsonKey(name: 'id') this.id, @JsonKey(name: 'amount') required this.amount, @JsonKey(name: 'ipl_rate_id') this.iplRateId, @JsonKey(name: 'item_id') required this.itemId});
  factory _IplRateDetailModel.fromJson(Map<String, dynamic> json) => _$IplRateDetailModelFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'amount') final  int amount;
@override@JsonKey(name: 'ipl_rate_id') final  String? iplRateId;
@override@JsonKey(name: 'item_id') final  String itemId;

/// Create a copy of IplRateDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IplRateDetailModelCopyWith<_IplRateDetailModel> get copyWith => __$IplRateDetailModelCopyWithImpl<_IplRateDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IplRateDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IplRateDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.iplRateId, iplRateId) || other.iplRateId == iplRateId)&&(identical(other.itemId, itemId) || other.itemId == itemId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,iplRateId,itemId);

@override
String toString() {
  return 'IplRateDetailModel(id: $id, amount: $amount, iplRateId: $iplRateId, itemId: $itemId)';
}


}

/// @nodoc
abstract mixin class _$IplRateDetailModelCopyWith<$Res> implements $IplRateDetailModelCopyWith<$Res> {
  factory _$IplRateDetailModelCopyWith(_IplRateDetailModel value, $Res Function(_IplRateDetailModel) _then) = __$IplRateDetailModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'amount') int amount,@JsonKey(name: 'ipl_rate_id') String? iplRateId,@JsonKey(name: 'item_id') String itemId
});




}
/// @nodoc
class __$IplRateDetailModelCopyWithImpl<$Res>
    implements _$IplRateDetailModelCopyWith<$Res> {
  __$IplRateDetailModelCopyWithImpl(this._self, this._then);

  final _IplRateDetailModel _self;
  final $Res Function(_IplRateDetailModel) _then;

/// Create a copy of IplRateDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? amount = null,Object? iplRateId = freezed,Object? itemId = null,}) {
  return _then(_IplRateDetailModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,iplRateId: freezed == iplRateId ? _self.iplRateId : iplRateId // ignore: cast_nullable_to_non_nullable
as String?,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
