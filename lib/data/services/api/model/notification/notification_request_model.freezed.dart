// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationRequestModel {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'house_id') String? get houseId;@JsonKey(name: 'rt_id') String? get rtId;@JsonKey(name: 'title') String get title;@JsonKey(name: 'body') String get body;@JsonKey(name: 'category') String get category;@JsonKey(name: 'data') Map<String, dynamic> get data;@JsonKey(name: 'read_at') DateTime? get readAt;
/// Create a copy of NotificationRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationRequestModelCopyWith<NotificationRequestModel> get copyWith => _$NotificationRequestModelCopyWithImpl<NotificationRequestModel>(this as NotificationRequestModel, _$identity);

  /// Serializes this NotificationRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.readAt, readAt) || other.readAt == readAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,houseId,rtId,title,body,category,const DeepCollectionEquality().hash(data),readAt);

@override
String toString() {
  return 'NotificationRequestModel(id: $id, userId: $userId, houseId: $houseId, rtId: $rtId, title: $title, body: $body, category: $category, data: $data, readAt: $readAt)';
}


}

/// @nodoc
abstract mixin class $NotificationRequestModelCopyWith<$Res>  {
  factory $NotificationRequestModelCopyWith(NotificationRequestModel value, $Res Function(NotificationRequestModel) _then) = _$NotificationRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'house_id') String? houseId,@JsonKey(name: 'rt_id') String? rtId,@JsonKey(name: 'title') String title,@JsonKey(name: 'body') String body,@JsonKey(name: 'category') String category,@JsonKey(name: 'data') Map<String, dynamic> data,@JsonKey(name: 'read_at') DateTime? readAt
});




}
/// @nodoc
class _$NotificationRequestModelCopyWithImpl<$Res>
    implements $NotificationRequestModelCopyWith<$Res> {
  _$NotificationRequestModelCopyWithImpl(this._self, this._then);

  final NotificationRequestModel _self;
  final $Res Function(NotificationRequestModel) _then;

/// Create a copy of NotificationRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = null,Object? houseId = freezed,Object? rtId = freezed,Object? title = null,Object? body = null,Object? category = null,Object? data = null,Object? readAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,houseId: freezed == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String?,rtId: freezed == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _NotificationRequestModel implements NotificationRequestModel {
  const _NotificationRequestModel({@JsonKey(name: 'id') this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'house_id') this.houseId, @JsonKey(name: 'rt_id') this.rtId, @JsonKey(name: 'title') required this.title, @JsonKey(name: 'body') required this.body, @JsonKey(name: 'category') required this.category, @JsonKey(name: 'data') required final  Map<String, dynamic> data, @JsonKey(name: 'read_at') this.readAt}): _data = data;
  factory _NotificationRequestModel.fromJson(Map<String, dynamic> json) => _$NotificationRequestModelFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'house_id') final  String? houseId;
@override@JsonKey(name: 'rt_id') final  String? rtId;
@override@JsonKey(name: 'title') final  String title;
@override@JsonKey(name: 'body') final  String body;
@override@JsonKey(name: 'category') final  String category;
 final  Map<String, dynamic> _data;
@override@JsonKey(name: 'data') Map<String, dynamic> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}

@override@JsonKey(name: 'read_at') final  DateTime? readAt;

/// Create a copy of NotificationRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationRequestModelCopyWith<_NotificationRequestModel> get copyWith => __$NotificationRequestModelCopyWithImpl<_NotificationRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.rtId, rtId) || other.rtId == rtId)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.readAt, readAt) || other.readAt == readAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,houseId,rtId,title,body,category,const DeepCollectionEquality().hash(_data),readAt);

@override
String toString() {
  return 'NotificationRequestModel(id: $id, userId: $userId, houseId: $houseId, rtId: $rtId, title: $title, body: $body, category: $category, data: $data, readAt: $readAt)';
}


}

/// @nodoc
abstract mixin class _$NotificationRequestModelCopyWith<$Res> implements $NotificationRequestModelCopyWith<$Res> {
  factory _$NotificationRequestModelCopyWith(_NotificationRequestModel value, $Res Function(_NotificationRequestModel) _then) = __$NotificationRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'house_id') String? houseId,@JsonKey(name: 'rt_id') String? rtId,@JsonKey(name: 'title') String title,@JsonKey(name: 'body') String body,@JsonKey(name: 'category') String category,@JsonKey(name: 'data') Map<String, dynamic> data,@JsonKey(name: 'read_at') DateTime? readAt
});




}
/// @nodoc
class __$NotificationRequestModelCopyWithImpl<$Res>
    implements _$NotificationRequestModelCopyWith<$Res> {
  __$NotificationRequestModelCopyWithImpl(this._self, this._then);

  final _NotificationRequestModel _self;
  final $Res Function(_NotificationRequestModel) _then;

/// Create a copy of NotificationRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = null,Object? houseId = freezed,Object? rtId = freezed,Object? title = null,Object? body = null,Object? category = null,Object? data = null,Object? readAt = freezed,}) {
  return _then(_NotificationRequestModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,houseId: freezed == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String?,rtId: freezed == rtId ? _self.rtId : rtId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
