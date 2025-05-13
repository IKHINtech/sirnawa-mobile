// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ipl_rate_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IplRateRequestModel {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'amount') int get ammount;@JsonKey(name: 'block_id') String? get blockId;@JsonKey(name: 'rt_id') String get rtId;@JsonKey(name: 'house_type') String? get houseType;@JsonKey(name: 'start_date') String get startDate;
/// Create a copy of IplRateRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IplRateRequestModelCopyWith<IplRateRequestModel> get copyWith => _$IplRateRequestModelCopyWithImpl<IplRateRequestModel>(this as IplRateRequestModel, _$identity);

  /// Serializes this IplRateRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IplRateRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.ammount, ammount) || other.ammount == ammount)&&(identical(other.blockId, blockId) || other.blockId == blockId)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.houseType, houseType) || other.houseType == houseType)&&(identical(other.startDate, startDate) || other.startDate == startDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ammount,blockId,rtId,houseType,startDate);

@override
String toString() {
  return 'IplRateRequestModel(id: $id, ammount: $ammount, blockId: $blockId, rtId: $rtId, houseType: $houseType, startDate: $startDate)';
}


}

/// @nodoc
abstract mixin class $IplRateRequestModelCopyWith<$Res>  {
  factory $IplRateRequestModelCopyWith(IplRateRequestModel value, $Res Function(IplRateRequestModel) _then) = _$IplRateRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'amount') int ammount,@JsonKey(name: 'block_id') String? blockId,@JsonKey(name: 'rt_id') String rtId,@JsonKey(name: 'house_type') String? houseType,@JsonKey(name: 'start_date') String startDate
});




}
/// @nodoc
class _$IplRateRequestModelCopyWithImpl<$Res>
    implements $IplRateRequestModelCopyWith<$Res> {
  _$IplRateRequestModelCopyWithImpl(this._self, this._then);

  final IplRateRequestModel _self;
  final $Res Function(IplRateRequestModel) _then;

/// Create a copy of IplRateRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? ammount = null,Object? blockId = freezed,Object? rtId = null,Object? houseType = freezed,Object? startDate = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,ammount: null == ammount ? _self.ammount : ammount // ignore: cast_nullable_to_non_nullable
as int,blockId: freezed == blockId ? _self.blockId : blockId // ignore: cast_nullable_to_non_nullable
as String?,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,houseType: freezed == houseType ? _self.houseType : houseType // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _IplRateRequestModel implements IplRateRequestModel {
  const _IplRateRequestModel({@JsonKey(name: 'id') this.id, @JsonKey(name: 'amount') required this.ammount, @JsonKey(name: 'block_id') this.blockId, @JsonKey(name: 'rt_id') required this.rtId, @JsonKey(name: 'house_type') this.houseType, @JsonKey(name: 'start_date') required this.startDate});
  factory _IplRateRequestModel.fromJson(Map<String, dynamic> json) => _$IplRateRequestModelFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'amount') final  int ammount;
@override@JsonKey(name: 'block_id') final  String? blockId;
@override@JsonKey(name: 'rt_id') final  String rtId;
@override@JsonKey(name: 'house_type') final  String? houseType;
@override@JsonKey(name: 'start_date') final  String startDate;

/// Create a copy of IplRateRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IplRateRequestModelCopyWith<_IplRateRequestModel> get copyWith => __$IplRateRequestModelCopyWithImpl<_IplRateRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IplRateRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IplRateRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.ammount, ammount) || other.ammount == ammount)&&(identical(other.blockId, blockId) || other.blockId == blockId)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.houseType, houseType) || other.houseType == houseType)&&(identical(other.startDate, startDate) || other.startDate == startDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ammount,blockId,rtId,houseType,startDate);

@override
String toString() {
  return 'IplRateRequestModel(id: $id, ammount: $ammount, blockId: $blockId, rtId: $rtId, houseType: $houseType, startDate: $startDate)';
}


}

/// @nodoc
abstract mixin class _$IplRateRequestModelCopyWith<$Res> implements $IplRateRequestModelCopyWith<$Res> {
  factory _$IplRateRequestModelCopyWith(_IplRateRequestModel value, $Res Function(_IplRateRequestModel) _then) = __$IplRateRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'amount') int ammount,@JsonKey(name: 'block_id') String? blockId,@JsonKey(name: 'rt_id') String rtId,@JsonKey(name: 'house_type') String? houseType,@JsonKey(name: 'start_date') String startDate
});




}
/// @nodoc
class __$IplRateRequestModelCopyWithImpl<$Res>
    implements _$IplRateRequestModelCopyWith<$Res> {
  __$IplRateRequestModelCopyWithImpl(this._self, this._then);

  final _IplRateRequestModel _self;
  final $Res Function(_IplRateRequestModel) _then;

/// Create a copy of IplRateRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? ammount = null,Object? blockId = freezed,Object? rtId = null,Object? houseType = freezed,Object? startDate = null,}) {
  return _then(_IplRateRequestModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,ammount: null == ammount ? _self.ammount : ammount // ignore: cast_nullable_to_non_nullable
as int,blockId: freezed == blockId ? _self.blockId : blockId // ignore: cast_nullable_to_non_nullable
as String?,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,houseType: freezed == houseType ? _self.houseType : houseType // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
