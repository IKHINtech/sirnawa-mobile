// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ipl_rate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IplRateModel {

@JsonKey(name: 'id') String get id;@JsonKey(name: 'amount') int get ammount;@JsonKey(name: 'block_id') String? get blockId;@JsonKey(name: 'rt_id') String get rtId;@JsonKey(name: 'house_type') String? get houseType;@JsonKey(name: 'start_date') DateTime get startDate;
/// Create a copy of IplRateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IplRateModelCopyWith<IplRateModel> get copyWith => _$IplRateModelCopyWithImpl<IplRateModel>(this as IplRateModel, _$identity);

  /// Serializes this IplRateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IplRateModel&&(identical(other.id, id) || other.id == id)&&(identical(other.ammount, ammount) || other.ammount == ammount)&&(identical(other.blockId, blockId) || other.blockId == blockId)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.houseType, houseType) || other.houseType == houseType)&&(identical(other.startDate, startDate) || other.startDate == startDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ammount,blockId,rtId,houseType,startDate);

@override
String toString() {
  return 'IplRateModel(id: $id, ammount: $ammount, blockId: $blockId, rtId: $rtId, houseType: $houseType, startDate: $startDate)';
}


}

/// @nodoc
abstract mixin class $IplRateModelCopyWith<$Res>  {
  factory $IplRateModelCopyWith(IplRateModel value, $Res Function(IplRateModel) _then) = _$IplRateModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'amount') int ammount,@JsonKey(name: 'block_id') String? blockId,@JsonKey(name: 'rt_id') String rtId,@JsonKey(name: 'house_type') String? houseType,@JsonKey(name: 'start_date') DateTime startDate
});




}
/// @nodoc
class _$IplRateModelCopyWithImpl<$Res>
    implements $IplRateModelCopyWith<$Res> {
  _$IplRateModelCopyWithImpl(this._self, this._then);

  final IplRateModel _self;
  final $Res Function(IplRateModel) _then;

/// Create a copy of IplRateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ammount = null,Object? blockId = freezed,Object? rtId = null,Object? houseType = freezed,Object? startDate = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ammount: null == ammount ? _self.ammount : ammount // ignore: cast_nullable_to_non_nullable
as int,blockId: freezed == blockId ? _self.blockId : blockId // ignore: cast_nullable_to_non_nullable
as String?,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,houseType: freezed == houseType ? _self.houseType : houseType // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _IplRateModel implements IplRateModel {
  const _IplRateModel({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'amount') required this.ammount, @JsonKey(name: 'block_id') this.blockId, @JsonKey(name: 'rt_id') required this.rtId, @JsonKey(name: 'house_type') this.houseType, @JsonKey(name: 'start_date') required this.startDate});
  factory _IplRateModel.fromJson(Map<String, dynamic> json) => _$IplRateModelFromJson(json);

@override@JsonKey(name: 'id') final  String id;
@override@JsonKey(name: 'amount') final  int ammount;
@override@JsonKey(name: 'block_id') final  String? blockId;
@override@JsonKey(name: 'rt_id') final  String rtId;
@override@JsonKey(name: 'house_type') final  String? houseType;
@override@JsonKey(name: 'start_date') final  DateTime startDate;

/// Create a copy of IplRateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IplRateModelCopyWith<_IplRateModel> get copyWith => __$IplRateModelCopyWithImpl<_IplRateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IplRateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IplRateModel&&(identical(other.id, id) || other.id == id)&&(identical(other.ammount, ammount) || other.ammount == ammount)&&(identical(other.blockId, blockId) || other.blockId == blockId)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.houseType, houseType) || other.houseType == houseType)&&(identical(other.startDate, startDate) || other.startDate == startDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ammount,blockId,rtId,houseType,startDate);

@override
String toString() {
  return 'IplRateModel(id: $id, ammount: $ammount, blockId: $blockId, rtId: $rtId, houseType: $houseType, startDate: $startDate)';
}


}

/// @nodoc
abstract mixin class _$IplRateModelCopyWith<$Res> implements $IplRateModelCopyWith<$Res> {
  factory _$IplRateModelCopyWith(_IplRateModel value, $Res Function(_IplRateModel) _then) = __$IplRateModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'amount') int ammount,@JsonKey(name: 'block_id') String? blockId,@JsonKey(name: 'rt_id') String rtId,@JsonKey(name: 'house_type') String? houseType,@JsonKey(name: 'start_date') DateTime startDate
});




}
/// @nodoc
class __$IplRateModelCopyWithImpl<$Res>
    implements _$IplRateModelCopyWith<$Res> {
  __$IplRateModelCopyWithImpl(this._self, this._then);

  final _IplRateModel _self;
  final $Res Function(_IplRateModel) _then;

/// Create a copy of IplRateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ammount = null,Object? blockId = freezed,Object? rtId = null,Object? houseType = freezed,Object? startDate = null,}) {
  return _then(_IplRateModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ammount: null == ammount ? _self.ammount : ammount // ignore: cast_nullable_to_non_nullable
as int,blockId: freezed == blockId ? _self.blockId : blockId // ignore: cast_nullable_to_non_nullable
as String?,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,houseType: freezed == houseType ? _self.houseType : houseType // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
