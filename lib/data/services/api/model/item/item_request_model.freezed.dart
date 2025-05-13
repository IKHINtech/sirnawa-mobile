// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ItemRequestModel {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'description') String get description;@JsonKey(name: 'rt_id') String get rtId;@JsonKey(name: 'item_type') String get itemType;
/// Create a copy of ItemRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemRequestModelCopyWith<ItemRequestModel> get copyWith => _$ItemRequestModelCopyWithImpl<ItemRequestModel>(this as ItemRequestModel, _$identity);

  /// Serializes this ItemRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.itemType, itemType) || other.itemType == itemType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,rtId,itemType);

@override
String toString() {
  return 'ItemRequestModel(id: $id, name: $name, description: $description, rtId: $rtId, itemType: $itemType)';
}


}

/// @nodoc
abstract mixin class $ItemRequestModelCopyWith<$Res>  {
  factory $ItemRequestModelCopyWith(ItemRequestModel value, $Res Function(ItemRequestModel) _then) = _$ItemRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'name') String name,@JsonKey(name: 'description') String description,@JsonKey(name: 'rt_id') String rtId,@JsonKey(name: 'item_type') String itemType
});




}
/// @nodoc
class _$ItemRequestModelCopyWithImpl<$Res>
    implements $ItemRequestModelCopyWith<$Res> {
  _$ItemRequestModelCopyWithImpl(this._self, this._then);

  final ItemRequestModel _self;
  final $Res Function(ItemRequestModel) _then;

/// Create a copy of ItemRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? description = null,Object? rtId = null,Object? itemType = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,itemType: null == itemType ? _self.itemType : itemType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ItemRequestModel implements ItemRequestModel {
  const _ItemRequestModel({@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'description') required this.description, @JsonKey(name: 'rt_id') required this.rtId, @JsonKey(name: 'item_type') required this.itemType});
  factory _ItemRequestModel.fromJson(Map<String, dynamic> json) => _$ItemRequestModelFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'description') final  String description;
@override@JsonKey(name: 'rt_id') final  String rtId;
@override@JsonKey(name: 'item_type') final  String itemType;

/// Create a copy of ItemRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemRequestModelCopyWith<_ItemRequestModel> get copyWith => __$ItemRequestModelCopyWithImpl<_ItemRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.itemType, itemType) || other.itemType == itemType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,rtId,itemType);

@override
String toString() {
  return 'ItemRequestModel(id: $id, name: $name, description: $description, rtId: $rtId, itemType: $itemType)';
}


}

/// @nodoc
abstract mixin class _$ItemRequestModelCopyWith<$Res> implements $ItemRequestModelCopyWith<$Res> {
  factory _$ItemRequestModelCopyWith(_ItemRequestModel value, $Res Function(_ItemRequestModel) _then) = __$ItemRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'name') String name,@JsonKey(name: 'description') String description,@JsonKey(name: 'rt_id') String rtId,@JsonKey(name: 'item_type') String itemType
});




}
/// @nodoc
class __$ItemRequestModelCopyWithImpl<$Res>
    implements _$ItemRequestModelCopyWith<$Res> {
  __$ItemRequestModelCopyWithImpl(this._self, this._then);

  final _ItemRequestModel _self;
  final $Res Function(_ItemRequestModel) _then;

/// Create a copy of ItemRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? description = null,Object? rtId = null,Object? itemType = null,}) {
  return _then(_ItemRequestModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,rtId: null == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String,itemType: null == itemType ? _self.itemType : itemType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
